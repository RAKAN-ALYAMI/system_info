#!/bin/bash

# حقوق التأليف والنشر © 2024 RAKAN ALYAMI
# جميع الحقوق محفوظة.

# أكواد ANSI لتنسيق النص
BOLD_YELLOW="\033[1;33m"
RESET="\033[0m"

# اختيار اللغة
echo "اختر اللغة / Choose Language:"
echo "1. العربية (Arabic)"
echo "2. English (الإنجليزية)"
read -p "ادخل رقم الخيار (Enter the option number): " lang_choice

if [ "$lang_choice" == "1" ]; then
    language="Arabic"
elif [ "$lang_choice" == "2" ]; then
    language="English"
else
    echo "Invalid option! Defaulting to English."
    language="English"
fi

# بدء حلقة الخيارات
while true; do
    # عرض الخيارات بناءً على اللغة المختارة
    if [ "$language" == "English" ]; then
        echo "Please choose an option:"
        echo "1. CPU Type"
        echo "2. RAM Type"
        echo "3. Disk Type"
        echo "4. Number of Processors"
        echo "5. Number of Disks"
        echo "6. Disk Size"
        echo "7. Remaining Space"
        echo "8. Open Ports"
        echo "9. Display Files in Selected Format"
        echo "10. System Type"
        echo "11. Network Speed"
        echo "12. IP Addresses"
        echo "13. CPU Usage"
        echo "14. Memory Usage"
        echo "15. System Load Average"
        echo "16. Active Processes"
        echo "17. Top Memory-Consuming Processes"
        echo "18. Installed Packages"
        echo "19. Update Packages"
        echo "20. User Accounts"
        echo "21. Last Login"
        echo "22. Firewall Status"
        echo "23. View System Logs"
        echo "24. Event Log"
        echo "25. Kernel Version"
        echo "26. Uptime"
        echo "27. Distribution Information"
        echo "28. Exit"
    else
        echo "الرجاء اختيار الخيار:"
        echo "1. نوع المعالج"
        echo "2. نوع الرام"
        echo "3. نوع الهارديسك"
        echo "4. عدد المعالجات"
        echo "5. عدد الهارديسك"
        echo "6. حجم الهاردسك"
        echo "7. كم باقي من المساحة"
        echo "8. المنافذ المفتوحة"
        echo "9. استعراض الملفات بصيغة معينة"
        echo "10. نوع النظام"
        echo "11. سرعة الشبكة"
        echo "12. عناوين IP"
        echo "13. استخدام المعالج"
        echo "14. استخدام الذاكرة"
        echo "15. معدل تحميل النظام"
        echo "16. العمليات النشطة"
        echo "17. أكثر العمليات استهلاكًا للذاكرة"
        echo "18. الحزم المثبتة"
        echo "19. تحديث الحزم"
        echo "20. حسابات المستخدمين"
        echo "21. آخر تسجيل دخول"
        echo "22. حالة الجدار الناري"
        echo "23. عرض سجل النظام"
        echo "24. سجل الأحداث"
        echo "25. إصدار النواة"
        echo "26. وقت التشغيل"
        echo "27. معلومات التوزيعة"
        echo "28. خروج"
    fi

    read -p "ادخل رقم الخيار (Enter the option number): " option_choice

    # تنفيذ العملية بناءً على الخيار المختار
    case $option_choice in
        1)
            cpu_type=$(lscpu | grep "Model name" | awk -F: '{ print $2 }')
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}CPU Type: $cpu_type${RESET}"
            else
                echo -e "${BOLD_YELLOW}نوع المعالج: $cpu_type${RESET}"
            fi
            ;;
        2)
            ram_type=$(sudo dmidecode --type 17 | grep "Type:" | head -n 1 | awk -F: '{ print $2 }')
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}RAM Type: $ram_type${RESET}"
            else
                echo -e "${BOLD_YELLOW}نوع الرام: $ram_type${RESET}"
            fi
            ;;
        3)
            disk_type=$(lsblk -d -o name,rota | grep '^sd' | awk '{if ($2 == 1) print "HDD"; else print "SSD"}')
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Disk Type: $disk_type${RESET}"
            else
                echo -e "${BOLD_YELLOW}نوع الهارديسك: $disk_type${RESET}"
            fi
            ;;
        4)
            num_processors=$(nproc)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Number of Processors: $num_processors${RESET}"
            else
                echo -e "${BOLD_YELLOW}عدد المعالجات: $num_processors${RESET}"
            fi
            ;;
        5)
            num_disks=$(lsblk -d | grep '^sd' | wc -l)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Number of Disks: $num_disks${RESET}"
            else
                echo -e "${BOLD_YELLOW}عدد الهارديسك: $num_disks${RESET}"
            fi
            ;;
        6)
            disk_size=$(df -h --total | grep 'total' | awk '{print $2}')
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Disk Size: $disk_size${RESET}"
            else
                echo -e "${BOLD_YELLOW}حجم الهاردسك: $disk_size${RESET}"
            fi
            ;;
        7)
            remaining_space=$(df -h --total | grep 'total' | awk '{print $4}')
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Remaining Space: $remaining_space${RESET}"
            else
                echo -e "${BOLD_YELLOW}كم باقي من المساحة: $remaining_space${RESET}"
            fi
            ;;
        8)
            open_ports=$(ss -tuln | grep LISTEN)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Open Ports: $open_ports${RESET}"
            else
                echo -e "${BOLD_YELLOW}المنافذ المفتوحة: $open_ports${RESET}"
            fi
            ;;
        9)
            read -p "Enter the file format (ادخل صيغة الملفات): " selected_format
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Selected Format: $selected_format${RESET}"
                find / -type f -name "*.$selected_format"
            else
                echo -e "${BOLD_YELLOW}الصيغة المختارة: $selected_format${RESET}"
                find / -type f -name "*.$selected_format"
            fi
            ;;
        10)
            system_type=$(uname -o)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}System Type: $system_type${RESET}"
            else
                echo -e "${BOLD_YELLOW}نوع النظام: $system_type${RESET}"
            fi
            ;;
        11)
            network_speed=$(cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/speed)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Network Speed: ${network_speed}Mb/s${RESET}"
            else
                echo -e "${BOLD_YELLOW}سرعة الشبكة: ${network_speed}Mb/s${RESET}"
            fi
            ;;
        12)
            ip_addresses=$(hostname -I)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}IP Addresses: $ip_addresses${RESET}"
            else
                echo -e "${BOLD_YELLOW}عناوين IP: $ip_addresses${RESET}"
            fi
            ;;
        13)
            cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\\([0-9.]*\\)%* id.*/\\1/" | awk '{print 100 - $1"%"}')
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}CPU Usage: $cpu_usage${RESET}"
            else
                echo -e "${BOLD_YELLOW}استخدام المعالج: $cpu_usage${RESET}"
            fi
            ;;
        14)
            memory_usage=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\\n", $3,$2,$3*100/$2 }')
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Memory Usage: $memory_usage${RESET}"
            else
                echo -e "${BOLD_YELLOW}استخدام الذاكرة: $memory_usage${RESET}"
            fi
            ;;
        15)
            load_average=$(uptime | awk -F'load average:' '{ print $2 }')
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}System Load Average: $load_average${RESET}"
            else
                echo -e "${BOLD_YELLOW}معدل تحميل النظام: $load_average${RESET}"
            fi
            ;;
        16)
            active_processes=$(ps aux --sort=-%cpu | head -n 10)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Active Processes: ${RESET}"
                echo "$active_processes"
            else
                echo -e "${BOLD_YELLOW}العمليات النشطة: ${RESET}"
                echo "$active_processes"
            fi
            ;;
        17)
            top_mem_processes=$(ps aux --sort=-%mem | head -n 10)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Top Memory-Consuming Processes: ${RESET}"
                echo "$top_mem_processes"
            else
                echo -e "${BOLD_YELLOW}أكثر العمليات استهلاكًا للذاكرة: ${RESET}"
                echo "$top_mem_processes"
            fi
            ;;
        18)
            installed_packages=$(dpkg --get-selections | wc -l)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Installed Packages: $installed_packages${RESET}"
            else
                echo -e "${BOLD_YELLOW}الحزم المثبتة: $installed_packages${RESET}"
            fi
            ;;
        19)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Updating Packages...${RESET}"
            else
                echo -e "${BOLD_YELLOW}تحديث الحزم...${RESET}"
            fi
            sudo apt-get update && sudo apt-get upgrade -y
            ;;
        20)
            user_accounts=$(cut -d: -f1 /etc/passwd)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}User Accounts: $user_accounts${RESET}"
            else
                echo -e "${BOLD_YELLOW}حسابات المستخدمين: $user_accounts${RESET}"
            fi
            ;;
        21)
            last_login=$(last -n 1)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Last Login: $last_login${RESET}"
            else
                echo -e "${BOLD_YELLOW}آخر تسجيل دخول: $last_login${RESET}"
            fi
            ;;
        22)
            firewall_status=$(sudo ufw status)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Firewall Status: $firewall_status${RESET}"
            else
                echo -e "${BOLD_YELLOW}حالة الجدار الناري: $firewall_status${RESET}"
            fi
            ;;
        23)
            system_logs=$(sudo tail -n 20 /var/log/syslog)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}System Logs: $system_logs${RESET}"
            else
                echo -e "${BOLD_YELLOW}سجل النظام: $system_logs${RESET}"
            fi
            ;;
        24)
            event_log=$(sudo tail -n 20 /var/log/auth.log)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Event Log: $event_log${RESET}"
            else
                echo -e "${BOLD_YELLOW}سجل الأحداث: $event_log${RESET}"
            fi
            ;;
        25)
            kernel_version=$(uname -r)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Kernel Version: $kernel_version${RESET}"
            else
                echo -e "${BOLD_YELLOW}إصدار النواة: $kernel_version${RESET}"
            fi
            ;;
        26)
            uptime=$(uptime -p)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Uptime: $uptime${RESET}"
            else
                echo -e "${BOLD_YELLOW}وقت التشغيل: $uptime${RESET}"
            fi
            ;;
        27)
            distribution_info=$(lsb_release -a)
            if [ "$language" == "English" ]; then
                echo -e "${BOLD_YELLOW}Distribution Information: $distribution_info${RESET}"
            else
                echo -e "${BOLD_YELLOW}معلومات التوزيعة: $distribution_info${RESET}"
            fi
            ;;
        28)
            if [ "$language" == "English" ]; then
                echo "Exiting..."
            else
                echo "الخروج..."
            fi
            break
            ;;
        *)
            if [ "$language" == "English" ]; then
                echo "Invalid option selected."
            else
                echo "خيار غير صحيح."
            fi
            ;;
    esac

    echo "" # سطر فارغ للفصل بين العمليات
done
