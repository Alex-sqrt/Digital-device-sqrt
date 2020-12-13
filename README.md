# Digital-device-sqrt
Курсовая работа. Разработка интегрального цифрового устройства
1. Описание проекта
Проект представляет собой совокупность исходных файлов для проектирования цифровой интегральной схемы, выполняющей функцию  вычисления квадратного корня. Моделирование проводится в Cadence Incisive, логический синтез в Cadence RTL_Compiler, генерация топологии в Cadence Encounter, верификация топологии в Cadence Virtuoso.
2. Описание репозитория 
В ветке main содержатся необходимые исходные файлы (tcl скрипты, verilog - описание и др.), в ветке current - некоторые файлы, которые необходимо было изменить.
3. Описание скриптов
Файл Sqrt2.v используется при моделировании поведенческой модели (вместе с тестбенчем Sqrt2_TB.v), а также при логическом синтезе.
Файл Sqrt2_TB.v представляет собой тестбенч, который используется при моделировании на этапе поведенческой модели и после логического синтеза.
Файл Sqrt2_TB_sdf.v используется после генерации топологии. Он отличается от предыдущего файла наличием пути к SDF файлу, который генерируется после этапа топологии.
Файл In.dat представляет собой входной тестовый сигнал. Отсчеты записаны в шестнадцатиричном формате. Используется для моделирования на этапе поведенческой модели, после логического синтеза и после генераии топологии.
Файл Out_expected.dat представляет собой ожидаемый выходной сигнал. Он используется для определения правильности работы устройства после моделирования.
Файл Sqrt2.sdc используется на этапе логического синтеза и генерации топологии. В нем содержится информация о временных ограничения, в частности частота и неопределенность тактового сигнала и входная и выходная задержки.
Файлы X-FAB_typ.tcl, X-FAB_min.tcl, X-FAB_max.tcl используются для указания путей до технологических библиотек в случае типичного, медленного и быстрого корнера соответственно. Эти файлы используются на этапе логического синтеза.
Файлы MyModule_synth.tcl, MyModule_synth_min.tcl, MyModule_synth_max.tcl представляют собой команды для RTL_Compiler в случае типичного, медленного и быстрого корнера соответственно. Эти файлы используются на этапе логического синтеза.
Файл MMMC.tcl используется на этапе генерации топологии. Он содержит информацию о корнерах.
Файл Module_pins используется на этапе генерации топологии. Он содержит информацию об положениях пинов.
Файл Sqrt2_PaR.tcl используется на этапе генерации топологии. Он содержит команды для Encounter.
4. Сборка проекта
Необходимо создать папку Source и добавить туда все файлы. Далее создать папку RTL_Compiler и запустить оттуда терминал (отдельная папка необходима, чтобы туда записывались все .log файлы). Ввести команду RTL_Compiler ../Source/MyModule_synth.tcl. После логического синтеза в папке Reports появятся отчеты, а в папке /Source/Synthesis синтезированный netlist Sqrt2_synth.v и файл временных ограничений Sqrt2_out.sdc. Также можно провести логический синтез в случае медленного и бычтрого корнера. Выходные отчеты будут иметь постфикс max или min в зависисмости от корнера. Netlist и sdc файл для этих корнеров не будут генерироваться.
После получения netlist его можно промоделировать в Cadence Incisive, который запускается через команду Incisive в терминале (терминал запускается из папки Source).
Далее необходимо создать папку Encounter и запустить оттуда терминал (отдельная папка нужна по той же причине, что и для RTL_Compiler). Далее вводим команду Encounter ../Source/Sqrt2_PaR и ждем. Encounter выполнит все необходимые команды. В папке Outputs появятся выходные файлы: SDF, netlist для симуляций, DEF, физический netlist.
После этого этапа также можно провести моделирование, используя тестбенч Sqrt2_TB_sdf.v (там необходимо указать название SDF файла, по умолчанию Sqrt2.sdf).
Далее проводится верификация в Cadence Virtuoso путем импорта физического нетлиста и DEF файла с помощью DRC и LVS проверок.
