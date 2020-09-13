#**********annotation**********
#��puts set
#********************
puts "�������"
puts case1:

set a 1
puts a
puts $a

#**********annotation**********
#�� 1.{}�÷��� 2.""�÷� ""���ǲ�Ҫ�κη��ŵ����,�����Ժ�û��a��$aͬʱ���ֵļ�����Ͳ���""�ˣ� 3.[]�÷�
#********************
puts \n
puts "������÷�{}\"\"[]"
puts case2:

set a 1
puts {$a}
puts "$a"

set c [set b 2]
puts c
puts $c

#**********annotation**********
#��expr Ҫ��Ҫת���㣬��ʽ������û��.0
#********************
puts \n
puts "����"
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
#���� �� ��� ͬ��
#********************
puts \n
puts "λ����"
puts case4:
#set a 01010101 ֱ�Ӹ��������ǲ��е�
#set b 10101010 
set a 60 
set b 13
set c [expr $a&$b]
puts $c
set c [expr $a|$b]
puts $c
set c [expr $a^$b]
puts $c
#set c ![$a^$b] �����ǲ��е�
puts [expr ~$c]

puts $a
puts [expr $a<<1]
puts [expr $a>>1]
#**********annotation**********
#��ѭ��
#********************
puts \n
puts "ѭ��"
puts case5_if1:
set x 0
if {$x == 0} {
    puts "x is 0"} else {
        puts "x is not 0"}
    #�﷨���ӵ�{}��{ һ��Ҫ������һ�У���Ȼ�ᱨ��

puts case5_if2:
set x 0
if {$x == 0} {puts "x is 0"} else {puts "x is not 0"}

puts case5_while1:
set x 0
while {$x <5} {
    puts "x is $x";
    set x [expr $x + 1] 
    #set x ����һ��Ҫ�пո� ��#һ��Ҫ��һ�е�ͷ��������Ч��ע�ͷ���
}

puts case5_while2:
set x 0
while {$x <5} {puts "x is $x";set x [expr $x + 1] }

puts case5_for1:
for {set x 0} {$x < 5} {incr x} {
    puts "x is $x"
}
#��Щ{}֮��һ��Ҫ�ո�
#for���﷨��ʵ��for(int i = 0;i<5;i++){}����ȫһ�µģ�����Ҳ����Ҫ����ǣ�ֻҪ����c��for��ôд�Ϳ����ˣ���ʵ����ѭ���﷨����c����ȫһ����

#**********annotation**********
#������
#********************
puts \n
puts "�������"
puts case6_define1:
set testarray(0) test0
set testarray(1) test1
set testarray(2) test2
puts [array names testarray]

puts "���������������"
puts case6_define1:
set staff(name) "foxxy"
set staff(sex) "male"
puts $staff(name)
puts $staff(sex)
#��python�����dict��һ����,���ǿ��Ը������������ʵ������c��enum��ע������������һά��������
puts [array names staff]

puts "�г�����������Ԫ��"
puts case6_1:
for {set i 0} {$i < 3} {incr i} { 
    puts "testarray($i):$testarray($i)"
}

puts case6_2:
#��һ�������һά������������
foreach index [array names testarray] {
    puts "$testarray($index)"
}

puts "����"
puts case6_lookup:
set element_to_find test1

foreach index [array names testarray] {
    if {$testarray($index) == $element_to_find} {
    puts "found $element_to_find"
    }
}

#**********annotation**********
#���ַ�������
#Perform a character-by-character comparison of strings string1 and string2. Returns -1, 0, or 1, depending on whether string1 is lexicographically less than, equal to, or greater than string2.
#********************
puts \n
puts "�ַ�������"
puts case7
puts [string compare a b] 
puts [string compare a a] 
puts [string compare b a] 

puts [string index "trinity" 3]

puts [string length "trinity"]

puts [string range "trinity" 2 10]
#�ɼ����Գ�����Χ

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
#��list
#********************
puts \n
puts "����list��3�ַ�ʽ"
set x "a b c"
puts "a is [lindex $x 0]"
set z [list x y z]
puts $z
set y [split 1/2/3/4 "/"]
puts "1 is [lindex $y 0]"

puts "��foreach�г�list������"
set i 0
foreach j $y {
    puts "$i item is $j";
    incr i;
}
puts "���в���"
puts $y
set z1 [linsert $y 1 1.5]
puts $z1
#insert

puts $y
set z2 [lreplace $y 1 2 a b]
puts $z2
#lreplace returns a new list formed by replacing one or more elements of list with the element arguments. first gives the zero-based index in list of the first element to be replaced. If first is less than zero then it is interpreted as zero. first must correspond to the index of an existing element in list. Last gives the index in list of the last element to be replaced. If last is less than first then no elements are deleted; the new elements are simply inserted before first. first or last may be end (or any abbreviation of it), which denotes the last element of the list.

puts "���в���"
set a1 "1 2"
set a2 "3 4"
set a3 [concat a1    a2]
puts $a3

lappend a1 $a2
puts $a1
#ע�������a1�ǲ���$���ŵģ�����

puts [llength $a1]
puts [llength $a2]
#���ص��Ǹ��������ǳ���

set a4 {a b d c }
puts [lsort $a4]
puts [lsort -decreasing $a4]

puts $a4
puts [lrange $a4 1 2]
#**********annotation**********
#��file
#********************
puts \n
puts "�ı�����:д"
set file_op2 [open "test.v" w+]
puts $file_op2 "carrol var11 var12 female\nfoxxy var21 var22 male"
#puts $file_op2 "miaoannotcl"
#���ܸ�vim���Զ���ָ������-_-
close $file_op2
#���������������$rp������һ�����̵ĸо�
#����һ��Ҫ�ǵ�close�������

puts \n
puts "�ı�����:��"
set file_op1 [open "test.v" r]
set file_data [read $file_op1]
puts $file_data
close $file_op1

puts \n
puts "���ı���ÿ�е���list�����в���"
#�򵥵����ı��еĺ˶Թ���
set file_name "test.v"
set file_op3 [open $file_name r]
while { [gets $file_op3 line] >=0 } {
    if { [lrange $line end end] == "female" } {
    puts [lindex $line 0];   
}    
}
close $file_op3

#**********annotation**********
#��proc
#********************
puts \n
puts "����"
proc sum {a b} {
    return [expr $a+$b]    
}
puts [sum 1 2]

#���Ĭ��ֵ
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
puts "����list�ĺϲ�"
set receiver_list "id1 id2 id3 id4"
set receiver_to_be_append "id5 id6"

#lappend  receiver_list $receiver_to_be_append
#puts "lappend�����ǰѺ�������list��һ��Ԫ�ؼӵ�ǰһ��list������:$receiver_list"

proc append_op {para_receiver_list para_receiver_to_be_append} {
   return [concat $para_receiver_list $para_receiver_to_be_append]
}
puts "��������ֻ�Ǹ������β�1:[append_op $receiver_list $receiver_to_be_append]"
puts "��������ֻ�Ǹ������β�2:$receiver_list"
set receiver_list [append_op $receiver_list $receiver_to_be_append]
puts "�ں����������ٵ���set�����޸�ԭ���Ķ���:$receiver_list"

puts \n
puts "������������ַ"
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
#��������ʽ
#********************
puts \n
 
set file_regop1 [open "regexp.v" w+]
puts $file_regop1 "The fat cat sat on the mat in room 101."
#puts $file_op2 "miaoannotcl"
#���ܸ�vim���Զ���ָ������-_-
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
#С���ſ���������ƥ�䵽�ĵ�һ������a��Ȼ�����С���ŵķֱ�ŵ������b c������ʾ,����Ҫ���ö��ţ���Ȼ�����װ��Լ�����
#tips:*��ʾ������ַ���+��ʾ1�������ַ���.��ʾһ���ַ�


#The fat cat sat on the mat in room 101.
regexp {([^f]at)} $line_regexp a 
puts "4:$a"

#The fat cat sat on the mat in room 101.
regexp {(\s[^f&^c]at\s)} $line_regexp a 
puts "5:$a"

#The fat cat sat on the mat in room 101.
regexp {(.01[.])} $line_regexp a 
puts "6:$a"
#[.]��ʾ���

#The fat cat sat on the mat in room 101.
regexp {^(...)} $line_regexp a 
puts "7:$a"

#The fat cat sat on the mat in room 101.
regexp {(...)$} $line_regexp a 
puts "8:$a"
#ע������101.��ͷ�и����ԵĻ��з���\n

#The fat cat sat on the mat in room 101.
regexp {(...(?=\son))} $line_regexp a 
puts "9:$a"
#�����Ǻܺ����ģ����Ÿ��Ӷ��ѣ��Ǹ�Github��ҳ��һ���Ͷ�
#����ò��tcl�Ķ��Ը�GitHub���е㲻ͬ-_-

set a "set_directive_loop_merge \"foo/part2\"
set_directive_loop_flatten \"foo/part2_1_outer\""
puts $a
