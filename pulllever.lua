local function moveToTarget(targetCFrame, speed)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait() -- Đợi nhân vật load lại
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart") -- Đảm bảo tồn tại

    local startPosition = humanoidRootPart.Position
    local targetPosition = targetCFrame.Position
    local direction = (targetPosition - startPosition).unit
    local distance = (targetPosition - startPosition).magnitude

    for i = 1, math.floor(distance / speed) do
        humanoidRootPart.CFrame = humanoidRootPart.CFrame + direction * speed
        wait(0.05) -- Delay tránh bị kick
    end

    humanoidRootPart.CFrame = targetCFrame -- Đảm bảo đến vị trí cuối cùng
end

local function clickMouseMultipleTimes(times, delayTime)
    local virtualInput = game:GetService("VirtualInputManager")

    for i = 1, times do
        virtualInput:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        wait(0.1) -- Nhấn giữ chuột một chút
        virtualInput:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        wait(delayTime) -- Delay giữa các lần nhấp
    end
end

local function completeQuest()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkToRock")
    wait(1)
    return true
end

-- **Bước 1: Bay đến bia đá**
moveToTarget(CFrame.new(-5353, 313, -2492), 250)
wait(1)

-- **Bước 2: Nói chuyện với bia đá (Nhấp chuột 15 lần, delay 0.3 giây)**
completeQuest()
clickMouseMultipleTimes(11, 0.1)
wait(6)

-- **Bước 3: Dịch chuyển đến đền thờ**
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286, 14895, 102))
wait(1)

-- **Bước 4: Bay đến cần gạt**
moveToTarget(CFrame.new(28575, 14936, 72), 250)
wait(1)

-- **Bước 5: Chạy script tự động gạt cần**
loadstring(game:HttpGet("https://raw.githubusercontent.com/nguyenduck18/script/refs/heads/main/t%E1%BB%B1%20g%E1%BA%A1t%20c%E1%BA%A7n"))()
wait(2) -- Chờ 7 giây để đảm bảo cần được gạt xong

-- **Bước 6: Reset nhân vật ngay sau 2 giây**
wait(2)
game.Players.LocalPlayer.Character:BreakJoints()
wait(2) -- Chờ 3 giây sau reset trước khi tiếp tục

-- **Bước 7: Chờ nhân vật load lại rồi mới bay**
local player = game.Players.LocalPlayer
local newCharacter = player.CharacterAdded:Wait() -- Chờ nhân vật xuất hiện
newCharacter:WaitForChild("HumanoidRootPart") -- Đảm bảo nhân vật đã load xong

moveToTarget(CFrame.new(-5353, 313, -2492), 250)
wait(1)

-- **Bước 8: Nói chuyện với bia đá lần nữa (Nhấp chuột 15 lần, delay 0.3 giây)**
completeQuest()
clickMouseMultipleTimes(5, 0.1)
wait(6)

-- **Bước 9: Reset nhân vật lần cuối**
game.Players.LocalPlayer.Character:BreakJoints()
