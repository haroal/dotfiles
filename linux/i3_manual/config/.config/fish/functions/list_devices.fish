function list_devices -d "List connected devices with path and name"

    echo -e '---------- Listing devices ---------- \n'

    for sysdevpath in (find /sys/bus/usb/devices/usb*/ -name dev);
        set syspath (string replace -r '/dev$' '' $sysdevpath)
        set devname (udevadm info -q name -p $syspath)

        if string match -q 'bus/' $devname
            continue
        end

        set id_serial (udevadm info -q property -p $syspath | grep 'ID_SERIAL=' | string replace 'ID_SERIAL=' '')

        if test -z $id_serial
            continue
        end

        echo "/dev/$devname - $id_serial"
    end

end
