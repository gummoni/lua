--[[
    �R�����g

]]

-- �֐��Ăяo��
local function func(arg1, arg2)
    return arg1 + 1, arg2 + 2
end

local value1, value2 = func(10, 20)


-- const
local value3 = 1
local value4 = {}

table.insert(value4, 123)

print(value1)
print(value2)
print(value3)
print(#value4)
print(value4)
print("--finish")

GlobalCount = 0
function OnGrab(val)
    GlobalCount = GlobalCount + val

    local num = GlobalCount % 3
    if num == 0 then
        print ("3�̔{��")
    else
        print (GlobalCount)
    end
end

OnGrab(1)
OnGrab(2)
OnGrab(3)

-- �Z�p���Z�q
local a = -1
a = a + 1
a = a - 1
a = a * -1
a = a / 1   -- ���������_
a = a // 1  -- �����_�؂�̂�
a = a % 1   -- ��]
a = a ^ 1   -- �ݏ�

-- �r�b�g���Z�q
a = a & 1
a = a | 1
a = a ~ 1
a = ~ 1
a = a << 1
a = a >> 1

-- ���d���
local b, c = 10, 20

-- ������
a = "hello world"
a = "hello " .. "world"     -- �A��

-- �G�X�P�[�v�V�[�P���X
-- \t \n �Ȃ�

-- �z��(���ӁF1�X�^�[�g)
local data = {1,2,3,4,5}

print(data[1])  -- 1
print(data[2])  -- 2
print(data[3])  -- 3

data[1] = data[1] + 10
print(data[1])  -- 11
table.remove(data, 1)
print(data[1])  -- 2

print(#data)   --�v�f��
print(data[1])
table.remove(data, 1)

print(#data)   --�v�f��
print(data[1])
table.remove(data)
print(#data)   --�v�f��
print(data[1])


local data2 = { {1,2,3}, {4,5,6}, {7,8,9} }

print(data2[1][1])  -- 1
print(data2[2][1])  -- 4
print(data2[3][1])  -- 7

-- �A�z�z��

local dic = { foo=10, bar=20 }
local key = "foo"
print(dic["foo"])
print(dic["bar"])
print(dic[key])

print(dic.foo)
dic.foo=123
print(dic.foo)

dic.foo = nil   -- �폜���鎞
print(dic.foo)
print(dic.abc)  -- �Y���L�[�������ꍇ��nil��Ԃ�

-- IF��
if a == 1 then
    print("������")
elseif a ~= 1 then
    print("�������Ȃ�")
elseif a < 1 then
    print("��菬����")
elseif a > 1 then
    print("���傫��")
elseif a <= 1 then
    print("��������������")
elseif a >= 1 then
    print("�傫����������")
else
    print("�Y���Ȃ�")
end

-- IF���̘_�����Z
a = 0
if not a == 1 then
    print("a��1�ł͂Ȃ�")
end

a = 1
b = 2
if a == 1 and b == 2 then
    print("a=1 ���� b=2�ł���")
end

b=0
if a == 1 or b == 2 then
    print("a=1 ���� b=2�ł���")
end

-- while��
a = 5
while 0 < a do
    print("while: " .. a)
    a = a - 1
end

-- repeat��
repeat 
    print("repeat: " .. a)
    a = a + 1
until a == 10

-- for��
-- a = �����l, ������, �����l
for a = 1, 10, 1 do
    print("for:" .. a)
end

-- ���[�v�������o������break���g���B
-- continue�͗p�ӂ���Ă��Ȃ�

-- for�� �C�e���[�^

dic["hello1"] = 120
dic["world1"] = 567
for ky, vl in pairs(dic) do
    print(ky .. " = ".. vl)
end

for i, vl in ipairs(data) do
    print("data[" .. i .. "] = " .. vl)
end


-- ���ϒl�����߂�
local dat = {1,2,3,4,5,6,7,8,9,10}
local sum = 0
for i,vl in ipairs(dat) do
    sum = sum + vl
end
sum = sum / #dat
print("ave=" .. sum)

--�R���[�`��

function Create_coro()
    return coroutine.create(
        function( init )
        if init == nil then 
                init = 0 
            end

            local i = init
            while i < 10 do
                i = i + 1
                coroutine.yield(i)
            end
            assert(false)

            -- return -1
        end
    )
end

local c1 = Create_coro()
local c2 = Create_coro()

while true do
    local check = 0
    if coroutine.status(c1) ~= "dead" then
        local stat1, ret1 = coroutine.resume( c1, 5 )
        if stat1 then
            print("1:->" , ret1)
        else
            print("1:assert! ->" , ret1)
        end
    end
    if coroutine.status(c2) ~= "dead" then
        local stat2, ret2 = coroutine.resume( c2, 5 )
        if stat2 then
            print("2:->" , ret2)
        else
            print("2:assert! ->" , ret2)
        end
    else
        break
    end
end


print("finish");
