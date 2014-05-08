#Ruby
puts " ----------------------- Basic moniplation --------------"
i=1
k="ss"
i=i+1
I=2
I=I+2
puts k
puts i
puts k+i.to_s				#不可直接轉型～這是基本提供轉型與轉字串
puts k.to_i+i
 
puts " ----------------------- Array Handling (1) --------------"
a=[1, "2", 33, "44"] 
puts a[1]
puts a.size
puts a.inspect 
 
puts " ----------------------- Array Handling (2) --------------"
b=["red",2, 3.0, "中文"]		#
b.push("blue")				#將"blue"推到最前面
puts b.inspect				#將b全部印出，字串會加上 [""]
b << "yellow"				#將yellow放到最後
puts b.join(", ")  			#利用, 將所有陣列資料輸出
 
puts " ----------------------- Hash Handling  --------------"
hashData = {"foo"=>123, "second"=>456, "third"=>"3rd", :fours=>"4rd"} # ":four"是一個symbol記憶體固定
puts hashData.size
puts hashData[:fours]
puts hashData["third"]
puts "foo".object_id   	#  字串 記憶變動
puts "foo".object_id   	# 
puts :fours.object_id  	#  Symbol 記憶不變
puts :fours.object_id  	#
hashData["fifth"]="5rd" #insert to hastable
puts hashData.size
puts hashData.inspect
 
puts " ----------------------- FLow control  --------------"
puts 1 > 2
if (1>2)				#if case
	puts "true"
else
	puts "else"
end
 
 
i=0
i+=1 until i > 5 		#Go over to 6 directly
puts "until"+i.to_s
 
i=0						#while case
while (i<10)
	i+=1
	puts i
end
 
puts "one line control" if (0) #除了 nil 與false 其餘都是true... 就算是0
 
# 抓出手機號碼 
phone = "123-456-7890"
if phone =~ /(\d{3})-(\d{3})-(\d{4})/		#regualer expression could be done and support in if condition.
  ext  = $1
  city = $2
  num  = $3
  puts "phone number is" + phone + " city is:" + city +" num is:"+ num + " ext is:" + ext
end
 
 
puts " ----------------------- function and class --------------"
 
# Function
def foo_1(act1)
	puts act1
end
 
foo_1 "go! foo"
 
# Class
class Person
	puts "init person"				#類似contstructor～但是只要經過就會執行
	def initialize(name)			#定義起始函式~為private
		@name=name
	end
	def name						#定義對外存取，類似 C++ get
		@name
	end
	def name=(name)					#定義set
		@name=name
	end
private								#定義成private
	def pri_walk(dest)
		puts "private walk to "+dest
	end
public
	def walk(dest)
		pri_walk "corner"
		puts "walk to "+dest
	end
end
 
class Student < Person
	def initialize(stu_name)
		@name=name
	end
	def name						#定義對外存取，類似 C++ get
		@name
	end
	def name=(name)					#定義set
		@name=name
	end			
	def walk(dest)
		puts "jump to "+dest
		super						#呼叫parent function
	end
end
 
puts "start class"
per1 = Person.new("John")
puts per1.name 
per1.name = "Tom"
puts per1.name 
per1.walk " public"
#per1.pri_walk "nowhere"
 
puts "Student comes"
per2= Student.new("stu Paul")
per2.walk "university"
 
 
puts " ----------------------- travelsal and iterator --------------"
 
#each iterator in array
langs = ["us", "tw", "cn"]
langs.each do | lang |
	puts lang
end
 
#iterator in number
 
number_array = [43,23,533,23,13,23,22]
puts number_array.inspect
number_array = number_array.find_all{|x| x%2==0}
puts number_array.inspect
number_array << 211
number_array << 224
number_array << [225, 139]					#[225,139]視為一個sub arrary 的元素要動作也必須全打..
number_array.delete_if {|x| x==22}
puts number_array.inspect
number_array.delete_if {|x| x==[225,139]}	#這樣才能消除 
puts number_array.inspect
 
#iterator injection
string_longest = ["sdas", "sdsadsw", "sdsdsd", "wewewwewew", "sdsd", "dqwdqwdqwdwd"]
puts string_longest.inspect
 
def find_longest(strs)
	logest =  strs.inject do |memo, word|
		(memo.length > word.length)? memo : word
		#puts "first = "+memo+ ", second = "+word
	end
	return logest
end
 
longest = find_longest(string_longest) 
 
puts string_longest.inspect
puts longest
 
 
def logstn(strs, number)
	while (number >0)
		logest =  strs.inject do |first, second|
			(first.length > second.length)? first : second
		end
		puts logest
		strs.delete_if {|x| x==logest}
		number -= 1
	end
end
 
logstn(string_longest, 3)