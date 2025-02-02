local isOpen = false  -- Создаем переменную для состояния меню

-- Создаем GUI
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Создаем фрейм для кнопок
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.2, 0, 0.4, 0)
frame.Position = UDim2.new(0.8, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Visible = false  -- Скрываем фрейм изначально
frame.Parent = gui

-- Создаем функцию для открытия и закрытия меню
local function toggleMenu()
    isOpen = not isOpen  -- Меняем состояние
    frame.Visible = isOpen  -- Устанавливаем видимость фрейма в зависимости от состояния
end

-- Создаем 2 кнопки
for i = 1, 5 do
    if i ~= 3 and i ~= 4 and i ~= 5 then
        local button = Instance.new("TextButton")
        button.Text = (i == 1) and "Хакер" or
                      (i == 2) and "Умный чел" or
                      "Кнопка " .. i  -- Меняем текст первой и второй кнопок
        button.Size = UDim2.new(1, 0, 0.2, 0)
        button.Position = UDim2.new(0, 0, ((i-1) - (i>3 and 2 or 0))*0.2, 0)
        button.BackgroundColor3 = (i == 1) and Color3.new(0, 1, 0) or
                                (i == 2) and Color3.new(1, 1, 0) or
                                Color3.new(1, 1, 1)  -- Красим первую кнопку в зеленый, вторую в желтый
        button.Parent = frame

        -- Добавляем обработчик нажатия на кнопку
        button.MouseButton1Click:Connect(function()
            print("Кнопка " .. (i == 1 and "Хакер" or i == 2 and "Умный чел" or i) .. " была нажата!")  -- Сообщение для кнопок

            -- Выполняем действие при нажатии на кнопку
            if i == 1 then
                game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("Phone", true, false)
            elseif i == 2 then
                game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("Book", true, false)
            end
        end)
    end
end

-- Создаем кнопку для открытия и закрытия меню с измененным текстом и цветом
local toggleButton = Instance.new("TextButton")
toggleButton.Text = "(Break in 2) OPEN THE DOOR!!!"  -- Измененный текст кнопки с названием меню
toggleButton.Size = UDim2.new(0.2, 0, 0.1, 0)
toggleButton.Position = UDim2.new(0.8, 0, 0, 0)
toggleButton.BackgroundColor3 = Color3.new(1, 0, 0)  -- Красный цвет кнопки
toggleButton.Parent = gui

-- Добавляем обработчик нажатия на кнопку для открытия и закрытия меню
toggleButton.MouseButton1Click:Connect(toggleMenu)
