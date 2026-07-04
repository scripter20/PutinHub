local P,C,U=game:GetService("Players"),game:GetService("CoreGui"),game:GetService("UserInputService")
local L=P.LocalPlayer
if C:FindFirstChild("PHub")then C.PHub:Destroy()end
local H=Instance.new("ScreenGui",C)H.Name="PHub"H.ResetOnSpawn=false
local M=Instance.new("Frame",H)M.Size=UDim2.new(0,540,0,310)M.Position=UDim2.new(0.5,-270,0.5,-155)M.BackgroundColor3=Color3.fromRGB(20,20,20)M.Active=true M.Draggable=true
Instance.new("UICorner",M).CornerRadius=UDim.new(0,9)
local Str=Instance.new("UIStroke",M)Str.Thickness=1.5 Str.Color=Color3.fromRGB(34,197,94)
local Sb=Instance.new("Frame",M)Sb.Size=UDim2.new(0,125,1,0)Sb.BackgroundColor3=Color3.fromRGB(14,14,14)Sb.ClipsDescendants=true
Instance.new("UICorner",Sb).CornerRadius=UDim.new(0,9)
local Sf=Instance.new("Frame",Sb)Sf.Size=UDim2.new(0,12,1,0)Sf.Position=UDim2.new(1,-12,0,0)Sf.BackgroundColor3=Color3.fromRGB(14,14,14)Sf.BorderSizePixel=0
local Sl=Instance.new("UIListLayout",Sb)Sl.Padding=UDim.new(0,6)Sl.SortOrder=Enum.SortOrder.LayoutOrder
local Sp=Instance.new("UIPadding",Sb)Sp.PaddingTop=UDim.new(0,42)Sp.PaddingLeft=UDim.new(0,8)Sp.PaddingRight=UDim.new(0,8)
local T=Instance.new("TextLabel",M)T.Size=UDim2.new(1,0,0,30)T.Position=UDim2.new(0,0,0,6)T.BackgroundTransparency=1 T.Text="PUTIN HUB"T.Font=Enum.Font.GothamBold T.TextColor3=Color3.new(1,1,1)T.TextSize=13
local Cont=Instance.new("Frame",M)Cont.Size=UDim2.new(1,-135,1,-45)Cont.Position=UDim2.new(0,130,0,38)Cont.BackgroundTransparency=1
local CB=Instance.new("TextButton",M)CB.Size=UDim2.new(0,24,0,24)CB.Position=UDim2.new(1,-30,0,8)CB.BackgroundColor3=Color3.fromRGB(28,28,28)CB.Text="×"CB.Font=Enum.Font.GothamBold CB.TextColor3=Color3.fromRGB(239,68,68)CB.TextSize=16
Instance.new("UICorner",CB).CornerRadius=UDim.new(0,5)
local TB=Instance.new("TextButton",H)TB.Size=UDim2.new(0,44,0,44)TB.Position=UDim2.new(0,15,0,15)TB.BackgroundColor3=Color3.fromRGB(20,20,20)TB.Text="P"TB.Font=Enum.Font.GothamBold TB.TextColor3=Color3.new(1,1,1)TB.TextSize=18 TB.ZIndex=10
Instance.new("UICorner",TB).CornerRadius=UDim.new(0,22)
local TStr=Instance.new("UIStroke",TB)TStr.Thickness=1.5 TStr.Color=Color3.fromRGB(34,197,94)
local pgs,btns,strs,cThm,cTab={},{},{},"Green","Main"
local thms={White=Color3.fromRGB(240,240,240),Black=Color3.fromRGB(35,35,35),Green=Color3.fromRGB(34,197,94),Blue=Color3.fromRGB(30,90,220),Orange=Color3.fromRGB(234,88,12),Purple=Color3.fromRGB(130,40,210),Kazakh=Color3.fromRGB(0,155,210)}
local function upThm(k)local c=thms[k]Str.Color=c TStr.Color=c for n,s in pairs(strs)do if n==k then s.Enabled=true s.Color=c s.Thickness=2 else s.Enabled=false end end for n,b in pairs(btns)do b.TextColor3=n==cTab and c or Color3.fromRGB(150,150,150)end end
local function swTab(n)cTab=n for k,p in pairs(pgs)do p.Visible=k==n end upThm(cThm)end
local function cTabF(n,o)
local b=Instance.new("TextButton",Sb)b.Size=UDim2.new(1,0,0,32)b.BackgroundTransparency=1 b.Text=n b.Font=Enum.Font.GothamBold b.TextSize=13 b.LayoutOrder=o btns[n]=b
local p=Instance.new("ScrollingFrame",Cont)p.Size=UDim2.new(1,0,1,0)p.BackgroundTransparency=1 p.Visible=false p.ScrollBarThickness=2 pgs[n]=p
b.MouseButton1Click:Connect(function()swTab(n)end)p.ChildAdded:Connect(function()task.wait(0.05)local l=p:FindFirstChildOfClass("UIListLayout")if l then p.CanvasSize=UDim2.new(0,0,0,l.AbsoluteContentSize.Y+25)end end)end
cTabF("Main",1)cTabF("Player",2)cTabF("AutoFarm",3)cTabF("Theme",4)cTabF("Info",5)
local function cHdr(p,t,o)local h=Instance.new("TextLabel",p)h.Size=UDim2.new(1,0,0,20)h.BackgroundTransparency=1 h.Text=t h.Font=Enum.Font.GothamBold h.TextSize=15 h.TextColor3=Color3.new(1,1,1)h.TextXAlignment=0 h.LayoutOrder=o end
local MP=pgs["Main"]Instance.new("UIListLayout",MP).Padding=UDim.new(0,12)Instance.new("UIPadding",MP).PaddingLeft=UDim.new(0,15)
cHdr(MP,"VISUALS",1)
local ETF=Instance.new("Frame",MP)ETF.Size=UDim2.new(1,0,0,34)ETF.BackgroundTransparency=1 ETF.LayoutOrder=2
local EB=Instance.new("TextButton",ETF)EB.Size=UDim2.new(0,140,1,0)EB.BackgroundColor3=Color3.fromRGB(25,35,25)EB.Text="ESP & NAMES: OFF"EB.Font=Enum.Font.GothamBold EB.TextColor3=Color3.fromRGB(239,68,68)EB.TextSize=11
Instance.new("UICorner",EB).CornerRadius=UDim.new(0,6)local EStr=Instance.new("UIStroke",EB)EStr.Color=Color3.fromRGB(239,68,68)
local PP=pgs["Player"]Instance.new("UIListLayout",PP).Padding=UDim.new(0,12)Instance.new("UIPadding",PP).PaddingLeft=UDim.new(0,15)
cHdr(PP,"MOVEMENT",1)
local ws,jp=16,50
local function cSld(t,mn,mx,df,st,o)
local f=Instance.new("Frame",PP)f.Size=UDim2.new(1,0,0,45)f.BackgroundTransparency=1 f.LayoutOrder=o
local tl=Instance.new("TextLabel",f)tl.Size=UDim2.new(1,0,0,18)tl.BackgroundTransparency=1 tl.Text=t..": "..df tl.Font=Enum.Font.GothamBold tl.TextSize=13 tl.TextColor3=Color3.fromRGB(180,180,180)tl.TextXAlignment=0
local tr=Instance.new("TextButton",f)tr.Size=UDim2.new(1,0,0,6)tr.Position=UDim2.new(0,0,0,25)tr.BackgroundColor3=Color3.fromRGB(35,45,35)tr.Text=""tr.AutoButtonColor=false
Instance.new("UICorner",tr).CornerRadius=UDim.new(0,3)
local fl=Instance.new("Frame",tr)fl.Size=UDim2.new((df-mn)/(mx-mn),0,1,0)fl.BackgroundColor3=Color3.fromRGB(34,197,94)fl.BorderSizePixel=0
Instance.new("UICorner",fl).CornerRadius=UDim.new(0,3)
local hld=false
local function upd(i)local p=math.clamp((i.Position.X-tr.AbsolutePosition.X)/tr.AbsoluteSize.X,0,1)local v=math.clamp(math.floor((mn+(mx-mn)*p)/st+0.5)*st,mn,mx)fl.Size=UDim2.new((v-mn)/(mx-mn),0,1,0)tl.Text=t..": "..v if t=="WalkSpeed"then ws=v else jp=v end end
tr.InputBegan:Connect(function(i)if i.UserInputType.Name:match("MouseButton1")or i.UserInputType.Name:match("Touch")then hld=true upd(i)end end)
U.InputChanged:Connect(function(i)if hld and(i.UserInputType.Name:match("MouseMovement")or i.UserInputType.Name:match("Touch"))then upd(i)end end)
U.InputEnded:Connect(function(i)if i.UserInputType.Name:match("MouseButton1")or i.UserInputType.Name:match("Touch")then hld=false end end)end
cSld("WalkSpeed",0,50,16,0.5,2)cSld("JumpPower",0,200,50,1,3)
local eE,oS=false,nil local eF=Instance.new("Folder",C)eF.Name="PHub_ESP"
EB.MouseButton1Click:Connect(function()eE=not eE if eE then EB.Text="ESP & NAMES: ON" EB.TextColor3=Color3.fromRGB(74,222,128)EStr.Color=Color3.fromRGB(34,197,94)else EB.Text="ESP & NAMES: OFF" EB.TextColor3=Color3.fromRGB(239,68,68)EStr.Color=Color3.fromRGB(239,68,68)eF:ClearAllChildren()oS=nil end end)
task.spawn(function()while task.wait(0.1)do pcall(function()if L.Character and L.Character:FindFirstChild("Humanoid")then local h=L.Character.Humanoid if h.WalkSpeed~=ws then h.WalkSpeed=ws end if h.JumpPower~=jp then h.UseJumpPower=true h.JumpPower=jp end end end)end end)
task.spawn(function()while task.wait(0.4)do if not eE then continue end pcall(function()local kF,gH=false,{}for _,p in ipairs(P:GetPlayers())do if p.Character then if p.Backpack:FindFirstChild("Knife")or p.Character:FindFirstChild("Knife")then kF=true end if p.Backpack:FindFirstChild("Gun")or p.Character:FindFirstChild("Gun")then table.insert(gH,p.Name)end end end if not kF and #gH==0 then oS=nil elseif #gH>0 and oS==nil then oS=gH[1]end
local cV={}for _,o in ipairs(eF:GetChildren())do if o.Adornee then cV[o.Name]=o end end
for _,p in ipairs(P:GetPlayers())do if p~=L and p.Character and p.Character:FindFirstChild("Head")then local c=p.Character local cl=Color3.fromRGB(34,197,94)if p.Backpack:FindFirstChild("Knife")or c:FindFirstChild("Knife")then cl=Color3.fromRGB(239,68,68)elseif p.Backpack:FindFirstChild("Gun")or c:FindFirstChild("Gun")then cl=oS==p.Name and Color3.fromRGB(59,130,246)or Color3.fromRGB(234,179,8)end
local hn,tn=p.Name.."_H",p.Name.."_T"local hl=cV[hn]or Instance.new("Highlight",eF)hl.Name=hn hl.Adornee=c hl.FillColor=cl hl.FillTransparency=0.6 hl.OutlineColor=cl hl.OutlineTransparency=0 cV[hn]=nil
local bg=cV[tn]or Instance.new("BillboardGui",eF)bg.Name=tn bg.Size=UDim2.new(0,120,0,24)bg.StudsOffset=Vector3.new(0,2.8,0)bg.AlwaysOnTop=true bg.Adornee=c.Head local l=bg:FindFirstChild("T")or Instance.new("TextLabel",bg)l.Name="T"l.Size=UDim2.new(1,0,1,0)l.BackgroundTransparency=1 l.Text=p.Name l.Font=Enum.Font.GothamBold l.TextSize=12 l.TextStrokeTransparency=0 l.TextColor3=cl cV[tn]=nil end end for _,o in pairs(cV)do o:Destroy()end end)end end)
local TP=pgs["Theme"]local TG=Instance.new("UIGridLayout",TP)TG.CellSize=UDim2.new(0,72,0,80)TG.CellPadding=UDim2.new(0,12,0,12)TG.HorizontalAlignment=1 TG.VerticalAlignment=1
local function cTB(k,c,d)local f=Instance.new("Frame",TP)f.BackgroundTransparency=1 local b=Instance.new("TextButton",f)b.Size=UDim2.new(1,0,0,46)b.BackgroundColor3=c b.Text=""Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)local s=Instance.new("UIStroke",b)s.ApplyStrokeMode=0 s.Enabled=false strs[k]=s
local l=Instance.new("TextLabel",f)l.Size=UDim2.new(1,0,0,25)l.Position=UDim2.new(0,0,0,50)l.BackgroundTransparency=1 l.Text=d l.Font=Enum.Font.GothamBold l.TextSize=11 b.MouseButton1Click:Connect(function()cThm=k upThm(k)swTab(cTab)end)end
cTB("White",thms.White,"White")cTB("Black",thms.Black,"Black")cTB("Green",thms.Green,"Green")cTB("Blue",thms.Blue,"Blue")cTB("Orange",thms.Orange,"Orange")cTB("Purple",thms.Purple,"Purple")cTB("Kazakh",thms.Kazakh,"Kazakh")
local IP=pgs["Info"]Instance.new("UIListLayout",IP).Padding=UDim.new(0,4)Instance.new("UIPadding",IP).PaddingLeft=UDim.new(0,15)
local function cIL(t,o,h)local l=Instance.new("TextLabel",IP)l.Size=UDim2.new(1,-20,0,h and 22 or 16)l.BackgroundTransparency=1 l.Text=t l.TextSize=h and 15 or 13 l.Font=h and Enum.Font.GothamBold or Enum.Font.Gotham l.TextXAlignment=0 l.LayoutOrder=o end
cIL("📋 INFO",1,true)cIL("• V: 3.9.1",2)cIL("• Dev: PavelDurak",3)
local CF=Instance.new("Frame",H)CF.Size=UDim2.new(0,260,0,120)CF.Position=UDim2.new(0.5,-130,0.5,-60)CF.BackgroundColor3=Color3.fromRGB(22,33,22)CF.Visible=false CF.Active=true CF.Draggable=true Instance.new("UICorner",CF).CornerRadius=UDim.new(0,8)
local CS=Instance.new("UIStroke",CF)CS.Color=Color3.fromRGB(239,68,68)CS.Thickness=1.5
local CL=Instance.new("TextLabel",CF)CL.Size=UDim2.new(1,-20,0,40)CL.Position=UDim2.new(0,10,0,15)CL.BackgroundTransparency=1 CL.Text="Закрыть Hub?"CL.TextColor3=Color3.new(1,1,1)CL.TextSize=16 CL.Font=Enum.Font.GothamBold
local YB=Instance.new("TextButton",CF)YB.Size=UDim2.new(0,100,0,32)YB.Position=UDim2.new(0,20,1,-45)YB.BackgroundColor3=Color3.fromRGB(185,28,28)YB.Text="Да"YB.TextColor3=Color3.new(1,1,1)YB.Font=Enum.Font.GothamBold Instance.new("UICorner",YB).CornerRadius=UDim.new(0,6)
local NB=Instance.new("TextButton",CF)NB.Size=UDim2.new(0,100,0,32)NB.Position=UDim2.new(1,-120,1,-45)NB.BackgroundColor3=Color3.fromRGB(40,60,40)NB.Text="Нет"NB.TextColor3=Color3.fromRGB(74,222,128)NB.Font=Enum.Font.GothamBold Instance.new("UICorner",NB).CornerRadius=UDim.new(0,6)
CB.MouseButton1Click:Connect(function()CF.Visible=true end)YB.MouseButton1Click:Connect(function()eF:Destroy()H:Destroy()end)NB.MouseButton1Click:Connect(function()CF.Visible=false end)TB.MouseButton1Click:Connect(function()M.Visible=not M.Visible end)
upThm("Green")swTab("Main")
