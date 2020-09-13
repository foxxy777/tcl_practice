#**********annotation**********
#↓puts set
#********************
puts "输入输出"
puts case1:

set a 1
puts a
puts $a

#**********annotation**********
#↓ 1.{}用法； 2.""用法 ""就是不要任何符号的情况,所以以后没有a和$a同时出现的简单情况就不用""了； 3.[]用法
#********************
puts \n
puts "这仨的用法{}\"\"[]"
puts case2:

set a 1
puts {$a}
puts "$a"

set c [set b 2]
puts c
puts $c

#**********annotation**********
#↓expr 要不要转浮点，看式子中有没有.0
#********************
puts \n
puts "运算"
puts case3:
set a 1
set b 2
set c $a+$b
puts c
puts $c
set c [expr $a+$b]
puts c
puts $c

set d [expr 10+5]
puts $d
set d [expr 10.0+5]
puts $d
set d [expr 3/7]
puts $d
set d [expr 3.0/7]
puts $d
set d [expr 3/7.0]
puts $d
set d [expr 3.0/7.0]
puts $d

#**********annotation**********
#↓与 或 异或 同或
#********************
puts \n
puts "位运算"
puts case4:
#set a 01010101 直接给二进制是不行的
#set b 10101010 
set a 60 
set b 13
set c [expr $a&$b]
puts $c
set c [expr $a|$b]
puts $c
set c [expr $a^$b]
puts $c
#set c ![$a^$b] 这样是不行的
puts [expr ~$c]

puts $a
puts [expr $a<<1]
puts [expr $a>>1]
#**********annotation**********
#↓循环
#********************
puts \n
puts "循环"
puts case5_if1:
set x 0
if {$x == 0} {
    puts "x is 0"} else {
        puts "x is not 0"}
    #语法句子的{}中{ 一定要放在上一行，不然会报错

puts case5_if2:
set x 0
if {$x == 0} {puts "x is 0"} else {puts "x is not 0"}

puts case5_while1:
set x 0
while {$x <5} {
    puts "x is $x";
    set x [expr $x + 1] 
    #set x 后面一定要有空格 且#一定要在一行的头部才是有效的注释符号
}

puts case5_while2:
set x 0
while {$x <5} {puts "x is $x";set x [expr $x + 1] }

puts case5_for1:
for {set x 0} {$x < 5} {incr x} {
    puts "x is $x"
}
#这些{}之间一定要空格
#for的语法其实跟for(int i = 0;i<5;i++){}是完全一致的，所以也不需要刻意记，只要想想c的for怎么写就可以了，其实所有循环语法都跟c是完全一样的

#**********annotation**********
#↓数组
#********************
puts \n
puts "数组操作"
puts case6_define1:
set testarray(0) test0
set testarray(1) test1
set testarray(2) test2
puts [array names testarray]

puts "用名字来命名序号"
puts case6_define1:
set staff(name) "foxxy"
set staff(sex) "male"
puts $staff(name)
puts $staff(sex)
#跟python里面的dict是一样的,就是可以给数字起个名，实现类似c的enum，注意它本质仍是一维数组来的
puts [array names staff]

puts "列出数组中所有元素"
puts case6_1:
for {set i 0} {$i < 3} {incr i} { 
    puts "testarray($i):$testarray($i)"
}

puts case6_2:
#↓一口气打出一维数组中所有数
foreach index [array names testarray] {
    puts "$testarray($index)"
}

puts "查找"
puts case6_lookup:
set element_to_find test1

foreach index [array names testarray] {
    if {$testarray($index) == $element_to_find} {
    puts "found $element_to_find"
    }
}

#**********annotation**********
#↓字符串操作
#Perform a character-by-character comparison of strings string1 and string2. Returns -1, 0, or 1, depending on whether string1 is lexicographically less than, equal to, or greater than string2.
#********************
puts \n
puts "字符串操作"
puts case7
puts [string compare a b] 
puts [string compare a a] 
puts [string compare b a] 

puts [string index "trinity" 3]

puts [string length "trinity"]

puts [string range "trinity" 2 10]
#可见可以超出范围

puts [string tolower "TRINITY"] 

set s1 "123456"
set s2 "456"
puts [string trimright $s1 $s2]
set s3 "123"
puts [string trimleft $s1 $s3]
set s4 5
puts [string trim $s1 $s4]
set s5 6
puts [string trim $s1 $s5]
#trim on both side
set s6 23
puts [string match $s6 $s1]
set s6 *23*
puts [string match $s6 $s1]
#no need of ""
set s6 "*23*"
puts [string match $s6 $s1]

set s7 "i love u "
puts [append s7 "miss rabbit"]

#**********annotation**********
#↓list
#********************
puts \n
puts "声明list的3种方式"
set x "a b c"
puts "a is [lindex $x 0]"
set z [list x y z]
puts $z
set y [split 1/2/3/4 "/"]
puts "1 is [lindex $y 0]"

puts "用foreach列出list中内容"
set i 0
foreach j $y {
    puts "$i item is $j";
    incr i;
}
puts "队列操作"
puts $y
set z1 [linsert $y 1 1.5]
puts $z1
#insert

puts $y
set z2 [lreplace $y 1 2 a b]
puts $z2
#lreplace returns a new list formed by replacing one or more elements of list with the element arguments. first gives the zero-based index in list of the first element to be replaced. If first is less than zero then it is interpreted as zero. first must correspond to the index of an existing element in list. Last gives the index in list of the last element to be replaced. If last is less than first then no elements are deleted; the new elements are simply inserted before first. first or last may be end (or any abbreviation of it), which denotes the last element of the list.

puts "队列操作"
set a1 "1 2"
set a2 "3 4"
set a3 [concat a1    a2]
puts $a3

lappend a1 $a2
puts $a1
#注意这里的a1是不用$符号的，很迷

puts [llength $a1]
puts [llength $a2]
#返回的是个数而不是长度

set a4 {a b d c }
puts [lsort $a4]
puts [lsort -decreasing $a4]

puts $a4
puts [lrange $a4 1 2]
#**********annotation**********
#↓file
#********************
puts \n
puts "文本操作:写"
set file_op2 [open "test.v" w+]
puts $file_op2 "carrol var11 var12 female\nfoxxy var21 var22 male"
#puts $file_op2 "miaoannotcl"
#不能跟vim的自定义指令联动-_-
close $file_op2
#这操作看起来相是$rp代表了一个进程的感觉
#这里一定要记得close这个进程

puts \n
puts "文本操作:读"
set file_op1 [open "test.v" r]
set file_data [read $file_op1]
puts $file_data
close $file_op1

puts \n
puts "将文本中每行当做list来进行操作"
#简单的在文本中的核对功能
set file_name "test.v"
set file_op3 [open $file_name r]
while { [gets $file_op3 line] >=0 } {
    if { [lrange $line end end] == "female" } {
    puts [lindex $line 0];   
}    
}
close $file_op3

#**********annotation**********
#↓proc
#********************
puts \n
puts "函数"
proc sum {a b} {
    return [expr $a+$b]    
}
puts [sum 1 2]

#添加默认值
proc sum {a {b 0}} {
    return [expr $a+$b]    
}
puts [sum 1 ]

proc say {} {
   puts "Never let anyone know what you are thinking.--Mario Puzo"
}
say

proc joinelement {element} {
    return [join [list "1" $element] "/"]
}
set element1 {2/3/4}
puts [joinelement element1]

proc joinelement {element} {
    return [join [list "1" $element] ""]
}
set element1 {2/3/4}
puts [joinelement element1]


puts \n
puts "两个list的合并"
set receiver_list "id1 id2 id3 id4"
set receiver_to_be_append "id5 id6"

#lappend  receiver_list $receiver_to_be_append
#puts "lappend函数是把后面整个list当一个元素加到前一个list里面了:$receiver_list"

proc append_op {para_receiver_list para_receiver_to_be_append} {
   return [concat $para_receiver_list $para_receiver_to_be_append]
}
puts "函数里面只是复制了形参1:[append_op $receiver_list $receiver_to_be_append]"
puts "函数里面只是复制了形参2:$receiver_list"
set receiver_list [append_op $receiver_list $receiver_to_be_append]
puts "在函数基础上再调用set才能修改原来的对象:$receiver_list"

puts \n
puts "整理待发邮箱地址"
proc add_email_addr {receiver_list} {
    set return_list_with_tail  {}
    foreach name $receiver_list {
    set eachaddr [join [list $name "qq.com" ] "@"]
    set return_list_with_tail [lappend return_list_with_tail $eachaddr]
    }
    return $return_list_with_tail
}
puts [add_email_addr $receiver_list]

#**********annotation**********
#↓正则表达式
#********************
puts \n
 
set file_regop1 [open "regexp.v" w+]
puts $file_regop1 "The fat cat sat on the mat in room 101."
#puts $file_op2 "miaoannotcl"
#不能跟vim的自定义指令联动-_-
close $file_regop1 

set file_regop2 [open "regexp.v" r]
set line_regexp [read $file_regop2]

#The fat cat sat on the mat in room 101.
regexp {([A-Z,a-z]*)} $line_regexp a 
puts "1:$a"

#The fat cat sat on the mat in room 101.
regexp {([T|t]he)} $line_regexp a 
puts "2:$a"

#The fat cat sat on the mat in room 101.
regexp {(.at).(.at)} $line_regexp a b c
puts "3:$a"
puts $b
puts $c
#小括号可以做到将匹配到的第一个串放a，然后把俩小括号的分别放到后面的b c里面显示,所以要多用逗号，不然很容易把自己搞晕
#tips:*表示任意个字符，+表示1个以上字符，.表示一个字符


#The fat cat sat on the mat in room 101.
regexp {([^f]at)} $line_regexp a 
puts "4:$a"

#The fat cat sat on the mat in room 101.
regexp {(\s[^f&^c]at\s)} $line_regexp a 
puts "5:$a"

#The fat cat sat on the mat in room 101.
regexp {(.01[.])} $line_regexp a 
puts "6:$a"
#[.]表示句号

#The fat cat sat on the mat in room 101.
regexp {^(...)} $line_regexp a 
puts "7:$a"

#The fat cat sat on the mat in room 101.
regexp {(...)$} $line_regexp a 
puts "8:$a"
#注意这里101.后头有个隐性的换行符号\n

#The fat cat sat on the mat in room 101.
regexp {(...(?=\son))} $line_regexp a 
puts "9:$a"
#断言是很好理解的，看着复杂而已，那个Github网页上一翻就懂
#不过貌似tcl的断言跟GitHub上有点不同-_-

set a "set_directive_loop_merge \"foo/part2\"
set_directive_loop_flatten \"foo/part2_1_outer\""
puts $a
