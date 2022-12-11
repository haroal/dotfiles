function reset_msr
    sudo modprobe msr
    sudo wrmsr -a 0x19a 0x0
end
