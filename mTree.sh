#!/bin/bash
#====================================================================================================================================
 mTreeListingOption()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 20);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=20;fi
 if [[ $aa -gt 20 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=20;fi
 if [[ $j1 -gt 20 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 20 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=25; a++ ))
  do
   echo -e "\e[${a};1H\e[34m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[34m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2H\e[1;35m LISTING OPTIONS\e[0m                                           \e[2m Варианты листинга\e[0m";
 echo -en "\e[3;1H\e[34m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[24;1H\e[34m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[26;1H\e[34m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[4;2H Все файлы распечатаны                                                    \e[32m -a \e[0m";}
  E1(){ echo -en "\e[5;2H List directories only                                                    \e[32m -d \e[0m";}
  E2(){ echo -en "\e[6;2H Переходит по символическим ссылкам, если они указывают на каталоги       \e[32m -l \e[0m";}
  E3(){ echo -en "\e[7;2H Печатает полный префикс пути для каждого файла                           \e[32m -f \e[0m";}
  E4(){ echo -en "\e[8;2H Оставайтесь только в текущей файловой системе. Аля найди -xdev           \e[32m -x \e[0m";}
  E5(){ echo -en "\e[9;2H Максимальная глубина отображения дерева каталогов                  \e[32m -L level \e[0m";}
  E6(){ echo -en "\e[10;2H Рекурсивно пересечь дерево каталогов каждого уровня                      \e[32m -R \e[0m";}
  E7(){ echo -en "\e[11;2H Перечислите файлы, соответствующие шаблону подстановочного знака \e[32m -P pattern \e[0m";}
  E8(){ echo -en "\e[12;2H Не указывайте файлы, соответствующие подстановочным знакам       \e[32m -I pattern \e[0m";}
  E9(){ echo -en "\e[13;2H Использует файлы git .gitignore для фильтрации файлов/каталогов \e[32m --gitignore \e[0m";}
 E10(){ echo -en "\e[14;2H Если шаблон соответствия указан опцией -P или -I              \e[32m --ignore-case \e[0m";}
 E11(){ echo -en "\e[15;2H Если шаблон соответствия указан опцией -P                       \e[32m --matchdirs \e[0m";}
 E12(){ echo -en "\e[16;2H Печатайте информацию метаданных в начале строки                 \e[32m --metafirst \e[0m";}
 E13(){ echo -en "\e[17;2H Заставляет дерево удалять пустые каталоги из выходных данных        \e[32m --prune \e[0m";}
 E14(){ echo -en "\e[18;2H Печатает комментарии к файлам, найденные в файлах .info              \e[32m --info \e[0m";}
 E15(){ echo -en "\e[19;2H Опускает печать отчета о файлах и каталогах в конце списка       \e[32m --noreport \e[0m";}
 E16(){ echo -en "\e[20;2H Установите набор символов, при выводе HTML                \e[32m --charset charset \e[0m";}
 E17(){ echo -en "\e[21;2H Не спускайтесь по каталогам, содержащим более # записей       \e[32m --filelimit # \e[0m";}
 E18(){ echo -en "\e[22;2H Печатает (подразумевается -D) используя синтаксис strftime \e[32m --timefmt format \e[0m";}
 E19(){ echo -en "\e[23;2H Отправить вывод в имя файла                                     \e[32m -o filename \e[0m";}
 E20(){ echo -en "\e[25;2H                                                                        \e[34m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;37m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Все файлы распечатаны:\e[32m tree -a\e[0m
 По умолчанию дерево не печатает скрытые файлы (начинающиеся с точки \`.').
 Ни в коем случае дерево не печатает конструкции файловой системы \`.'
 (текущий каталог) и \`..' (предыдущий каталог).
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;37m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 tree -d
\e[0m";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;37m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree -d\e[0m
 Переходит по символическим ссылкам, если они указывают на каталоги, как если бы это
 были каталоги.
 Символические ссылки, которые приводят к рекурсии, избегаются при обнаружении.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;37m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree -f\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[1;37m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree -x\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[1;37m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree -L\e[0m
#
\e[32m tree level\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[1;37m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Рекурсивно пересечь дерево каталогов каждого уровня (см. параметр -L)
 и на каждом из них снова выполнить дерево,
 добавив \`-o 00Tree.html' в качестве нового параметра.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[1;37m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Перечислите только те файлы, которые соответствуют шаблону подстановочного знака.
 У вас может быть несколько опций:
 -P. Примечание.
 Вы должны использовать опцию -a, чтобы также учитывать файлы, начинающиеся с точки
 \`.' для соответствия.
 Допустимыми операторами подстановки являются \`*' (любой ноль или более символов),
 \`**' (любой ноль или более символов, а также нулевые /'s, т. е. \`**\`
 может соответствовать одному /),
 \`?' (любой одиночный символ),
 \`[...]' (можно использовать любой одиночный символ, указанный в квадратных скобках
 (необязательно - (тире) для диапазона символов:
 например: [A-Z]) и \`[^...]' ( любой одиночный символ, не указанный в скобках),
 а \`|' разделяет альтернативные шаблоны. Символ '/'
 в конце шаблона соответствует каталогам, но не файлам.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[1;37m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Не указывайте файлы, соответствующие шаблону подстановочных знаков.
 У вас может быть несколько опций -I.
 См. выше -P для получения информации о шаблонах подстановочных знаков.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[1;37m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Использует файлы git .gitignore для фильтрации файлов и каталогов.
 Также используется /info/exclude, если он присутствует.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[1;37m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Если шаблон соответствия указан опцией -P или -I,
 это приведет к совпадению шаблона без учета регистра каждой буквы.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[1;37m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Если шаблон соответствия указан опцией -P, это приведет к тому, что этот шаблон
 будет применен к именам каталогов (в дополнение к именам файлов).
 В случае совпадения имени каталога сопоставление содержимого каталога отключается.
 Если используется опция --prune,
 пустые папки, соответствующие шаблону, не будут удалены.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[1;37m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Печатайте информацию метаданных в начале строки, а не после строк отступа.
\e[32m tree --metafirst\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[1;37m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Заставляет дерево удалять пустые каталоги из выходных данных,
 что полезно при использовании вместе с -P или -I.
 См. ОШИБКИ И ПРИМЕЧАНИЯ ниже для получения дополнительной информации об этой опции.
\e[32m tree --prune\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[1;37m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Печатает комментарии к файлам, найденные в файлах .info.
 См. ниже ФАЙЛЫ .INFO для получения дополнительной информации о формате файлов .info
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[1;37m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Опускает печать отчета о файлах и каталогах в конце древовидного списка
\e[32m tree --noreport\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[1;37m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Установите набор символов,
 который будет использоваться при выводе HTML и рисовании линий.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[1;37m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Не спускайтесь по каталогам, содержащим более # записей
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[1;37m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Печатает (подразумевается -D) и форматирует дату в соответствии со строкой формата,
 которая использует синтаксис strftime(3).
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[1;37m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отправить вывод в имя файла.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[1;37m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;mMTree;fi;;
esac;C;done
}
#====================================================================================================================================
 mTreeFileOption()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 14);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=14;fi
 if [[ $aa -gt 14 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=14;fi
 if [[ $j1 -gt 14 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 14 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=19; a++ ))
  do
   echo -e "\e[${a};1H\e[34m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[34m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2H\e[1;35m FILE OPTIONS\e[0m                                                   \e[2m Опции файлов\e[0m";
 echo -en "\e[3;1H\e[34m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[18;1H\e[34m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[20;1H\e[34m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[4;2H Печатайте непечатаемые символы в именах файлов                           \e[32m -q \e[0m";}
  E1(){ echo -en "\e[5;2H Печатайте непечатаемые символы как есть                                  \e[32m -N \e[0m";}
  E2(){ echo -en "\e[6;2H Заключите имена файлов в двойные кавычки                                 \e[32m -Q \e[0m";}
  E3(){ echo -en "\e[7;2H Распечатайте тип файла и разрешения для каждого файла (согласно ls -l)   \e[32m -p \e[0m";}
  E4(){ echo -en "\e[8;2H Выведите имя пользователя или UID #                                      \e[32m -u \e[0m";}
  E5(){ echo -en "\e[9;2H Выведите имя группы или номер GID файла, если имя группы отсутствует     \e[32m -g \e[0m";}
  E6(){ echo -en "\e[10;2H Выведите размер каждого файла в байтах вместе с именем                   \e[32m -s \e[0m";}
  E7(){ echo -en "\e[11;2H Распечатайте размер каждого файла, но в более удобном для чтения виде    \e[32m -h \e[0m";}
  E8(){ echo -en "\e[12;2H Аналогично -h, но вместо этого используйте единицы СИ (степени 1000)   \e[32m --si \e[0m";}
  E9(){ echo -en "\e[13;2H Для каждого каталога сообщите его размер как сумму размеров            \e[32m --du \e[0m";}
 E10(){ echo -en "\e[14;2H Выведите дату последнего изменения                                       \e[32m -D \e[0m";}
 E11(){ echo -en "\e[15;2H Добавьте специальные символы                                             \e[32m -F \e[0m";}
 E12(){ echo -en "\e[16;2H Печатает номер индексного дескриптора файла или каталога           \e[32m --inodes \e[0m";}
 E13(){ echo -en "\e[17;2H Печатает номер устройства, которому принадлежит файл или каталог   \e[32m --device \e[0m";}
 E14(){ echo -en "\e[19;2H                                                                        \e[34m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;37m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Печатайте непечатаемые символы в именах файлов
 в виде вопросительных знаков вместо символов по умолчанию.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;37m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Печатайте непечатаемые символы как есть,
 а не как экранированные восьмеричные числа.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;37m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Заключите имена файлов в двойные кавычки:\e[32m tree -Q\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;37m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree -p\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[1;37m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Выведите имя пользователя или UID #,
 если имя пользователя отсутствует, для файла.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[1;37m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree -g\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[1;37m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree -s\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[1;37m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Распечатайте размер каждого файла, но в более удобном для чтения виде:\e[32m tree -s\e[0m
 Например добавление буквы для размера:
\e[32m K\e[0m килобайтов
\e[32m M\e[0m мегабайтов
\e[32m G\e[0m гигабайтов
\e[32m T\e[0m терабайтов
\e[32m P\e[0m петабайтов
\e[32m E\e[0m эксабайтов
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[1;37m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree --si\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[1;37m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Для каждого каталога сообщите его размер как сумму размеров всех его файлов и
 подкаталогов (а также их файлов и т. д.). Общий объем использованного пространства
 также указывается в итоговом отчете (например, команда «du -c»). Эта опция требует,
 чтобы дерево прочитало все дерево каталогов перед его отправкой,
 см. ОШИБКИ И ПРИМЕЧАНИЯ ниже. Подразумевается -s.
\e[32m tree --du\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[1;37m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Выведите дату последнего изменения или, если используется -c,
 время последнего изменения статуса для указанного файла.
\e[32m tree -D\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[1;37m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавьте:
\e[32m \`/'\e[0m для каталогов
\e[32m \`='\e[0m для файлов сокетов
\e[32m \`*'\e[0m для исполняемых файлов
\e[32m \`>'\e[0m для дверей (Solaris)
\e[32m \`|'\e[0m для FIFO, согласно ls -F
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[1;37m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree --inodes\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[1;37m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree --device\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[1;37m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;mMTree;fi;;
esac;C;done

}
#====================================================================================================================================
 mTreeSortingOption()
{

#!/bin/bash
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 8);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=8;fi
 if [[ $aa -gt 8 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=8;fi
 if [[ $j1 -gt 8 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 8 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=13; a++ ))
  do
   echo -e "\e[${a};1H\e[34m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[34m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2H\e[1;35m SORTING OPTIONS\e[0m                                            \e[2m Опции сортировки\e[0m";
 echo -en "\e[3;1H\e[34m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[12;1H\e[34m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[14;1H\e[34m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[4;2H Отсортируйте вывод по версии                                             \e[32m -v \e[0m";}
  E1(){ echo -en "\e[5;2H Сортируйте вывод по времени последнего изменения, а не по алфавиту       \e[32m -t \e[0m";}
  E2(){ echo -en "\e[6;2H Сортируйте вывод по последнему изменению статуса, а не по алфавиту       \e[32m -c \e[0m";}
  E3(){ echo -en "\e[7;2H Не сортируйте. Перечисляет файлы в порядке каталогов                     \e[32m -U \e[0m";}
  E4(){ echo -en "\e[8;2H Отсортируйте вывод в обратном порядке                                    \e[32m -r \e[0m";}
  E5(){ echo -en "\e[9;2H Перечисляйте каталоги перед файлами                             \e[32m --dirsfirst \e[0m";}
  E6(){ echo -en "\e[10;2H Перечисляйте файлы перед каталогами                            \e[32m --filesfirst \e[0m";}
  E7(){ echo -en "\e[11;2H Сортируйте выходные данные по типу, а не по имени             \e[32m --sort[=]type \e[0m";}
  E8(){ echo -en "\e[13;2H                                                                        \e[34m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;37m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree -v\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;37m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree -t\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;37m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree -c\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;37m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m tree -U\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[1;37m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отсортируйте вывод в обратном порядке:\e[32m tree -r\e[0m
 Это метасортировка, которая изменяет вышеуказанные сорта.
 Эта опция отключена, если используется -U.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[1;37m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Перечисляйте каталоги перед файлами:\e[32m tree --dirsfirst\e[0m
 Это метасортировка, которая изменяет вышеуказанные сорта.
 Эта опция отключена, если используется -U
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[1;37m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Перечисляйте файлы перед каталогами:\e[32m tree --filesfirst\e[0m
 Это метасортировка, которая изменяет вышеуказанные сорта.
 Эта опция отключена, если используется -U.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[1;37m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сортируйте выходные данные по типу, а не по имени:\e[32m tree --sort[=]type\e[0m
 Возможные значения:
 ctime (-c)
 mtime (-t)
 размер или версия (-v).
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 8)D;echo -en "\e[1;37m";(E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;mMTree;fi;;
esac;C;done

}
#====================================================================================================================================
 mMTree()
{

 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 17);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=17;fi
 if [[ $aa -gt 17 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=17;fi
 if [[ $j1 -gt 17 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 17 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=30; a++ ))
  do
   echo -e "\e[${a};1H\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m"
  done
 echo -en "\e[1;1H\033[0m\033[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
 echo -en "\e[3;3H\e[1m *** tree ***\e[0m";
 echo -en "\e[4;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[5;3H\e[2m list contents of directories in a tree-like format\e[0m";
 echo -en "\e[6;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[16;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[17;3H\e[36m OPTIONS\e[0m                                                               Опции\e[0m";
 echo -en "\e[18;3H\e[2m Дерево понимает следующие ключи командной строки:\e[0m";
 echo -en "\e[26;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[28;1H\e[47;30m├\e[0m─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[31;1H\033[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";
}
  E0(){ echo -en "\e[7;3H Установка                                                          \e[32m INSTALL \e[0m";}
  E1(){ echo -en "\e[8;3H Kраткий обзор                                                     \e[32m SYNOPSIS \e[0m";}
  E2(){ echo -en "\e[9;3H Описание                                                       \e[32m DESCRIPTION \e[0m";}
  E3(){ echo -en "\e[10;3H Информационные файлы                                           \e[32m .INFO FILES \e[0m";}
  E4(){ echo -en "\e[11;3H Файлы                                                                \e[32m FILES \e[0m";}
  E5(){ echo -en "\e[12;3H Окружение                                                      \e[32m ENVIRONMENT \e[0m";}
  E6(){ echo -en "\e[13;3H Автор                                                               \e[32m AUTHOR \e[0m";}
  E7(){ echo -en "\e[14;3H Ошибки и примечания                                         \e[32m BUGS AND NOTES \e[0m";}
  E8(){ echo -en "\e[15;3H Смотрите также                                                    \e[32m SEE ALSO \e[0m";}
  E9(){ echo -en "\e[19;3H Варианты листинга                                          \e[32m LISTING OPTIONS \e[0m";}
 E10(){ echo -en "\e[20;3H Опции файлов                                                  \e[32m FILE OPTIONS \e[0m";}
 E11(){ echo -en "\e[21;3H Опции сортировки                                           \e[32m SORTING OPTIONS \e[0m";}
 E12(){ echo -en "\e[22;3H Графические опции                                         \e[32m GRAPHICS OPTIONS \e[0m";}
 E13(){ echo -en "\e[23;3H XML/JSON/HTML опции                                  \e[32m XML/JSON/HTML OPTIONS \e[0m";}
 E14(){ echo -en "\e[24;3H Опции ввода                                                  \e[32m INPUT OPTIONS \e[0m";}
 E15(){ echo -en "\e[25;3H Разные опции                                                  \e[32m MISC OPTIONS \e[0m";}
 E16(){ echo -en "\e[27;3H Grannik                                                                \e[32m Git \e[0m";}
 E17(){ echo -en "\e[29;3H                                                                       \e[34m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[47;30m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m sudo apt install tree\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[47;30m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 tree [-acdfghilnpqrstuvxACDFJQNSUX] [-L level [-R]] [-H baseHREF] [-T title]
 [-o filename] [-P pattern] [-I pattern] [--gitignore] [--matchdirs] [--metafirst]
 [--ignore-case] [--nolinks] [--inodes] [--device] [--sort[=]name] [--dirsfirst]
 [--filesfirst] [--filelimit #] [--si]  [--du]  [--prune]  [--timefmt[=]format]
 [--fromfile] [--info] [--noreport] [--version] [--help] [--] [directory ...]
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[47;30m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Tree — это программа рекурсивного просмотра каталогов, которая создает список
 файлов с отступом по глубине, который раскрашивается в цвета dircolors, если
 установлена переменная среды LS_COLORS и вывод осуществляется в tty.
 Без аргументов дерево перечисляет файлы в текущем каталоге.
 Когда заданы аргументы каталога, в дереве поочередно перечислены все файлы и/или
 каталоги, найденные в данных каталогах. По завершении перечисления всех найденных
 файлов/каталогов дерево возвращает общее количество перечисленных файлов и/или
 каталогов. По умолчанию при обнаружении символической ссылки путь, на который
 ссылается символическая ссылка, печатается после имени ссылки в формате:
\e[32m name -> real-path\e[0m
 Если указана опция \`-l' и символическая ссылка ссылается на реальный каталог,
 тогда дерево будет следовать по пути символической ссылки,
 как если бы это был реальный каталог.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[47;30m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Файлы .info аналогичны файлам .gitignore: если файл .info обнаруживается при
 сканировании каталога, он считывается и добавляется в стек информации .info.
 Каждый файл состоит из комментариев (строки, начинающиеся с решеток (#)) или
 шаблонов подстановочных знаков, которые могут соответствовать файлу относительно
 каталога, в котором находится файл .info. Если файл должен соответствовать
 шаблону, вкладка с отступом комментарий, следующий за шаблоном, используется в
 качестве комментария к файлу. Комментарий заканчивается строкой с отступом без
 табуляции. Несколько шаблонов, каждый в строке, могут использовать один и тот же
 комментарий.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[47;30m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m /etc/DIR_COLORS             \e[0m База данных системных цветов.
\e[32m ~/.dircolors                \e[0m База данных цветов пользователей.
\e[32m .gitignore                  \e[0m Файл исключений Git
\e[32m \$GIT_DIR/info/exclude       \e[0m Глобальный список исключений файлов git
\e[32m .info                       \e[0m Файл комментариев к файлу
\e[32m /usr/share/finfo/global_info\e[0m Файл комментариев глобального файла
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[47;30m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m LS_COLORS     \e[0m Информация о цвете, созданная dircolors
\e[32m TREE_COLORS   \e[0m Использует для информации о цвете через LS_COLORS, если установлен.
\e[32m TREE_CHARSET  \e[0m Набор символов дерева для использования в режиме HTML.
\e[32m CLICOLOR      \e[0m Включает раскрашивание,
                даже если TREE_COLORS или LS_COLORS не установлены.
\e[32m CLICOLOR_FORCE\e[0m Всегда включает раскрашивание (фактически -C)
\e[32m LC_CTYPE      \e[0m Локаль для вывода имени файла.
\e[32m LC_TIME       \e[0m Локаль для вывода timefmt, см. strftime(3).
\e[32m TZ            \e[0m Часовой пояс для вывода timefmt, см. strftime(3).
\e[32m STDDATA_FD    \e[0m Включите функцию stddata,
                при необходимости установите используемый дескриптор.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[47;30m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Steve Baker                              \e[36m ice@mama.indstate.edu\e[0m
 Вывод HTML взломан Francesc Rocher       \e[36m rocher@econ.udg.es\e[0m
 Поддержка кодировок и OS/2 Kyosuke Tokoro\e[36m NBG01720@nifty.ne.jp\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[47;30m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Дерево не удаляет «пустые» каталоги, если по умолчанию используются параметры -P
 и -I. Используйте опцию --prune.
 Параметры -h и --si округляются до ближайшего целого числа, в отличие от реализации
 ls, которая всегда округляет в большую сторону.
 Удаление файлов и каталогов с помощью параметров -I, -P и --filelimit приведет
 к неправильным отчетам о количестве файлов/каталогов.
 Параметры --prune и --du заставляют дерево накапливать все дерево в памяти перед
 его отправкой. Для больших деревьев каталогов это может привести к значительной
 задержке вывода и использованию больших объемов памяти.
 Буфер расширения timefmt ограничен смехотворно большими 255 символами.
 Вывод строк времени длиннее этого значения будет неопределенным,
 но гарантированно не превысит 255 символов.
 Деревья XML/JSON не окрашены, что немного обидно.
 Наверное, больше.
 Начиная с версии 2.0.0, в Linux дерево будет пытаться автоматически вывести
 компактное дерево JSON по файловому дескриптору 3 (то, что я называю stddata),
 если он присутствует, а переменная среды STDDATA_FD определена или установлена
 в положительное ненулевое значение дескриптора файла. значение, которое будет
 использоваться для вывода. Есть надежда, что когда-нибудь лучшая оболочка
 Linux/Unix сможет воспользоваться этой функцией,
 хотя BSON, вероятно, будет лучшим форматом для этого.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[47;30m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 dircolors, ls, find, du, strftime, gitignore
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[47;30m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;mTreeListingOption;INI;fi;;
 10)D;echo -en "\e[47;30m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;mTreeFileOption;INI;fi;;
 11)D;echo -en "\e[47;30m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;mTreeSortingOption;INI;fi;;
 12)D;echo -en "\e[47;30m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m -i\e[0m Заставляет дерево не печатать линии отступов, что полезно при использовании
 вместе с опцией -f.
 Также удаляет как можно больше пробелов при использовании с опциями -J или -x.
\e[32m -A\e[0m Включите функцию линейной графики ANSI при печати линий отступов.
\e[32m -S\e[0m Включите линейную графику CP437 (полезно при использовании шрифтов консольного
 режима Linux). Эта опция теперь эквивалентна \`--charset=IBM437'
 и со временем может быть устаревшей.
\e[32m -n\e[0m Всегда отключайте раскрашивание, это переопределяется опцией -C,
 однако переопределяет CLICOLOR_FORCE, если он присутствует.
\e[32m -C\e[0m Всегда включайте раскрашивание, используя встроенные цвета по умолчанию,
 если переменные среды LS_COLORS или TREE_COLORS не установлены.
 Полезно для раскрашивания вывода в канал.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[47;30m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m -X\e[0m Включите вывод XML. Выводит дерево каталогов в виде файла в формате XML.
\e[32m -J\e[0m Включите вывод JSON. Выводит дерево каталогов в виде массива в формате JSON.
\e[32m -H baseHREF\e[0m Включите вывод HTML, включая ссылки HTTP. Полезно для FTP-сайтов.
 baseHREF указывает базовое местоположение FTP при использовании вывода HTML.
 То есть локальным каталогом может быть \`/local/ftp/pub' но ссылка на него должна
 быть \`ftp://hostname.organization.domain/pub'
 (baseHREF должен быть \`ftp://hostname.organization.domain').').
 Подсказка: не используйте строки ANSI с этой опцией и не указывайте более одного
 каталога в списке каталогов.
 Если вы хотите использовать цвета через таблицу стилей CSS, используйте опцию -C
 в дополнение к этой опции, чтобы принудительно выводить цвет.
\e[32m -T title\e[0m Устанавливает заголовок и строку заголовка H1 в режиме вывода HTML.
\e[32m --nolinks\e[0m Отключает гиперссылки в выводе HTML.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[47;30m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m --fromfile\e[0m Считывает список каталогов из файла, а не из файловой системы.
 Пути, указанные в командной строке, представляют собой файлы для чтения,
 а не прямые пытается искать.
 Каталог с точкой (.) указывает, что дерево должно считывать пути из стандартного
 ввода. ПРИМЕЧАНИЕ: это подходит только для чтения выходных данных gram,
 такой как find, а не «tree -fi», поскольку символические ссылки невозможно
 (по крайней мере, пока) отличить от файлов, которые просто содержат
 «->» как часть имени файла.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[47;30m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m --help   \e[0m Outputs a verbose usage listing.
\e[32m --version\e[0m Outputs the version of tree.
\e[32m --       \e[0m Терминатор обработки опции.
 После этого никакие дополнительные параметры обрабатываться не будут.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[47;30m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 mTree Описание утилиты tree. List contents of directories in a tree-like format
 asciinema:\e[36m https://asciinema.org/a/620887\e[0m
 codeberg: \e[36m https://codeberg.org/Grannik/mTree\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[47;30m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;exit 0;fi;;
esac;C;done

}
 mMTree
