
start_time=$(date +%s)
fl -noX -f verify.fl
end_time=$(date +%s)  
elapsed_time=$((end_time - start_time))  
echo "runtime: $elapsed_time s" > voss_res.txt
    