#!/bin/bash -e

# --------
# GLOBAL VARS
# --------
remove_file_by_path() {
    local filepath="$1"
    if [ -e "$filepath" ]; then
        {
            rm "$filepath"
            echo "Removed $filepath"
        } || { 
            echo "[Exception] While removing file $filepath"
        }
    fi
}
first_process_pid=""
second_process_pid=""
arch_type="x86_64" # x86_64 aarch64
record_always="false"

# --------
# CHECK READ WRITE PERMISSION
# --------
if [ -r "$(pwd)" ] && [ -w "$(pwd)" ]; then
    echo "Current directory has read and write permissions."
else
    echo "Current directory does not have sufficient permissions. Adjusting permissions..."
    sudo chmod 777 -R "$(pwd)"
    echo "Permissions adjusted successfully."
fi

# --------
# READ CMD ARGS
# --------
if [ $# -lt 6 ]; then
    echo "[ERROR] Pass all the parameters like: $0 <radar_num> <radar_types> <radar_serial_numbers> <mode_ids> <enable_viewer> <enable_log>"
    exit 1
fi
numArgs=$#
temp=1
before_last=$((numArgs - temp))
enable_viewer="${!before_last}"
enable_log="${!#}"
radar_num="$1"
radar_types=()
radar_sns=()
mode_ids=()
index=2
for ((i = 0; i < radar_num; i++)); do
    arg="${!index}"
    radar_types+=("$arg")
    index=$(expr $index + 1)
done
for ((i = 0; i < radar_num; i++)); do
    arg="${!index}"
    radar_sns+=("$arg")
    index=$(expr $index + 1)
done
for ((i = 0; i < radar_num; i++)); do
    arg="${!index}"
    mode_ids+=("$arg")
    index=$(expr $index + 1)
done

# --------
# FOLDER LOGS
# --------
log_dir="logs"
mkdir -p "$log_dir"
log_file="$log_dir/$(date +'%Y-%m-%d_%H-%M-%S').txt"

# --------
# GET CONFIGURATION FILES
# --------
jsons=()
bins=()
for ((i = 0; i < radar_num; i++)); do
    radar_type="${radar_types[ i ]}"
    mode_id="${mode_ids[ i ]}"
    # ----- ZSIGNAL
    if [ "$radar_type" == "zsignal" ]; then
        json_param=""
        bin_param=""
        # Choose the mode
        if [ "$mode_id" == "1" ]; then
            echo "You selected mode 1."
            json_param="./zadar_config/zsignal/w_config_M0.json"
            bin_param="./zadar_config/zsignal/r_config_M0.bin"
        elif [ "$mode_id" == "2" ]; then
            echo "You selected mode 2."
            json_param="./zadar_config/zsignal/w_config_M1.json"
            bin_param="./zadar_config/zsignal/r_config_M1.bin"
        elif [ "$mode_id" == "3" ]; then
            echo "You selected mode 3."
            json_param="./zadar_config/zsignal/w_config_M2.json"
            bin_param="./zadar_config/zsignal/r_config_M2.bin"
        elif [ "$mode_id" == "4" ]; then
            echo "You selected mode 4."
            json_param="./zadar_config/zsignal/w_config_M3.json"
            bin_param="./zadar_config/zsignal/r_config_M3.bin"
        else
            echo "[ERROR] Invalid option: $mode_id"
            exit 1
        fi
        jsons+=("$json_param")
        bins+=("$bin_param")
    # ----- ZPROX
    elif [ "$radar_type" == "zprox" ]; then
        json_param=""
        bin_param=""
        # Choose the mode
        if [ "$mode_id" == "1" ]; then
            echo "You selected mode 1."
            json_param="./zadar_config/zprox/w_config0.json"
            bin_param="./zadar_config/zprox/r_config0.bin"
        elif [ "$mode_id" == "2" ]; then
            echo "You selected mode 2."
            json_param="./zadar_config/zprox/w_config1.json"
            bin_param="./zadar_config/zprox/r_config1.bin"
        elif [ "$mode_id" == "3" ]; then
            echo "You selected mode 3."
            json_param="./zadar_config/zprox/w_config2.json"
            bin_param="./zadar_config/zprox/r_config2.bin"
        elif [ "$mode_id" == "4" ]; then
            echo "You selected mode 4."
            json_param="./zadar_config/zprox/w_config3.json"
            bin_param="./zadar_config/zprox/r_config3.bin"
        else
            echo "[ERROR] Invalid option for mode_id: $mode_id"
            exit 1
        fi
        jsons+=("$json_param")
        bins+=("$bin_param")
    # ----- ZPRIME EDGE
    elif [ "$radar_type" == "zprime-edge" ]; then
        json_param="./zadar_config/zprime/viewer.json"
        bin_param="./"
        jsons+=("$json_param")
        bins+=("$bin_param")
    # ----- ZPRIME HOST
    elif [ "$radar_type" == "zprime" ]; then
        json_param=""
        bin_param=""
        # Choose the mode
        if [ "$mode_id" == "1" ]; then
            echo "You selected mode 1."
            json_param="./zadar_config/zprime/w_85m_512_config_T.json"
            bin_param="./zadar_config/zprime/r_85m_512_config_T.bin"
        elif [ "$mode_id" == "2" ]; then
            echo "You selected mode 2."
            json_param="./zadar_config/zprime/w_250m_512_config_T.json"
            bin_param="./zadar_config/zprime/r_250m_512_config_T.bin"
        elif [ "$mode_id" == "3" ]; then
            echo "You selected mode 3."
            json_param="./zadar_config/zprime/w_400m_512_config_T.json"
            bin_param="./zadar_config/zprime/r_400m_512_config_T.bin"
        else
            echo "[ERROR] Invalid option for mode_id: $mode_id"
            exit 1
        fi
        jsons+=("$json_param")
        bins+=("$bin_param")
    # ----- INVALID
    else
        echo "[ERROR] Invalid option for radar_type: $radar_type"
        exit 1
    fi
done

# --------
# LAUNCH SETUP
# --------
# ----- ZPRIME
if [ "$radar_type" == "zprime-edge" ] || [ "$radar_type" == "zprime" ]; then
    echo "=== LAUNCH SENSOR ZPRIME ==="
    # Get params
    radar_sn="${radar_sns[*]}"
    json_param="${jsons[*]}"
    bin_param="${bins[*]}"
    # Run receiver
    lib/zprime.py --sn "$radar_sn" --run-mode "$mode_id" &
    first_process_pid=$!
    sleep 2
    # Run cmd
    command="lib/zadar-run/AppRun --radar_num $radar_num --radar_sn $radar_sn --json $json_param --bin $bin_param --enable_viewer $enable_viewer --enable_log $enable_log"
    
# ----- ZSIGNAL & ZPROX
else
    # Reset to can connection
    echo "=== RESET CAN CONNECTION ==="
    for ((i=0; i<=$radar_num; i++)); do
        {
            ./lib/canfd_reset_by_number.sh "$i"
        } || {  
            echo ""
        }
    done
    sleep 2
    echo "=== LAUNCH SENSOR ZSIGNAL or ZPROX ==="
    # Get params
    radar_sn="${radar_sns[*]}"
    json_param="${jsons[*]}"
    bin_param="${bins[*]}"
    # Run cmd
    command="lib/zadar-run/AppRun --radar_num $radar_num --radar_sn $radar_sn --json $json_param --bin $bin_param --enable_viewer $enable_viewer --enable_log $enable_log"
fi

# --------
# LAUNCH RECORD
# --------
if [ "$record_always" == "true" ]; then
    echo "=== START RECORDING CSV==="
    command_record="lib/zadar-record/AppRun--radar_number $radar_num --scan off --odometry off --clusters off --tracks on &"
    echo "$command_record"
    eval "$command_record"
    record_process_pid=$!
fi

# --------
# LAUNCH RADAR
# --------
echo "$command"
{
    if [ "$enable_log" == "on" ]; then
        eval "$command" 2>&1 | tee -a "$log_file"
    else
        eval "$command"
    fi
} || { 
    echo "[Exception] "
}
sleep 1

# --------
# KILL FIRST PROCESS IF PRESENT
# --------
if kill -0 "$first_process_pid" 2>/dev/null; then
    echo "Kill process for zprime edge connection"
    kill -SIGINT "$first_process_pid"
fi

# --------
# KILL RECORD PROCESS
# --------
if [ "$record_always" == "true" ]; then
    if kill -0 "$record_process_pid" 2>/dev/null; then
        echo "Kill process RECORD"
        kill -SIGINT "$record_process_pid"
    fi
fi

# --------
# REMOVE VIEWER FILES IF PRESENT
# --------
echo "=== REMOVE TEMPORARY FILES ==="
remove_file_by_path "./.qglviewer.xml"
remove_file_by_path "./imgui.ini"
for ((i=0; i<=20; i++)); do
    remove_file_by_path "./zadar_data_radar${i}.ipc"
done
sleep 1

# --------
# EXIT
# --------
echo "=== EXIT ==="
exit 0
