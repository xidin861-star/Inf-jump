-- [[ 1. สร้าง UI และตั้งค่าให้ตายแล้วไม่หาย ]]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "InfJumpUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false -- สำคัญมาก: ทำให้ตายแล้ว UI ยังอยู่
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [[ 2. สร้างหน้าต่างหลัก (ลากได้) ]]
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.5, -75, 0.5, -50)
MainFrame.Size = UDim2.new(0, 150, 0, 100)
MainFrame.Active = true
MainFrame.Draggable = true -- ทำให้ลากได้อิสระ

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "KUYA INF JUMP"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14

-- [[ 3. ปุ่มเปิด/ปิด Infinite Jump ]]
local ToggleBtn = Instance.new("TextButton", MainFrame)
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Text = "OFF"
ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ToggleBtn.Size = UDim2.new(0.8, 0, 0, 40)
ToggleBtn.Position = UDim2.new(0.1, 0, 0.45, 0)
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamBold

local BtnCorner = Instance.new("UICorner", ToggleBtn)
BtnCorner.CornerRadius = UDim.new(0, 6)

-- [[ 4. ระบบ Infinite Jump Logic ]]
local InfJumpEnabled = false
local UserInputService = game:GetService("UserInputService")

-- ฟังก์ชันดักการกดกระโดด
UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled then
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState("Jumping") -- สั่งให้ตัวละครกระโดดกลางอากาศ
            end
        end
    end
end)

-- ปุ่มคลิกเพื่อเปิด/ปิด
ToggleBtn.MouseButton1Click:Connect(function()
    InfJumpEnabled = not InfJumpEnabled
    if InfJumpEnabled then
        ToggleBtn.Text = "ON"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
    else
        ToggleBtn.Text = "OFF"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end
end)

print("Inf Jump Loaded! 🗿🥊")
