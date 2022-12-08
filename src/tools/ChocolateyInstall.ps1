#---------------------------------------
#  Script de configuration Node-Red


Update-ExecutionPolicy Unrestricted

function beep {
    [console]::beep(200,250); [console]::beep(200,250)
}

#---------------------------------------
#region Main part
Write-BoxstarterMessage -color Magenta "Installe les applications"
choco install nssm -y
choco install nodejs.install -y

$nodered = "D:\services\node-red"
$DesktopIniContent = @"
[.ShellClassInfo]
IconResource=nodered.ico
IconIndex=0
ConfirmFileOp=0
"@
#region Icon data
$iconData = [System.Convert]::FromBase64String("AAABAAEAQEAAAAEAIAAoQgAAFgAAACgAAABAAAAAgAAAAAEAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAI8AAACPAAAAjwAAAI8AAACPNwAAj5cAAI/XAACP+AAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI/XAACPlwAAjzcAAI8AAACPAAAAjwAAAI8AAACPAAAAjwAAAI8AAACPlwAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACPlwAAjwAAAI8AAACPAAAAjwAAAI8AAACPtwAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI+3AACPAAAAjwAAAI8AAACPlwAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj5cAAI8AAACPNwAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACPNwAAj5cAAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj5cAAI/XAACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI/XAACP+AAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP+AAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//CwuU/0BAq/9VVbT/VVW0/1VVtP9VVbT/VVW0/1VVtP9VVbT/VVW0/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8DA5D/eXnE//b2+/////////////////////////////////////////////////8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8EBJH/u7vh////////////////////////////////////////////////////////////AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//dXXC/////////////////////////////////////////////////////////////////wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//BQWR//T0+v/////////////////l5fT/rKzb/6qq2v+qqtr/qqra/6qq2v+qqtr/qqra/6qq2v8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/y8vpP/////////////////n5/T/ERGW/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/9aWrf/////////////////qanZ/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/xoamv87O6n/WVm2/3Z2w/+MjMz/mZnS/5ub0/+qqtr/q6va/////////////////6Oj1/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/x0dnP9ubr//qqra/+Tk8////////////////////////////////////////////8/P6v////////////////+jo9f/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8DA5D/Wlq3/76+4v/9/f7////////////////////////////////////////////////////////////Ozun/////////////////o6PX/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/9RUbP/1dXt////////////////////////////////////////////////////////////////////////////zMzp/////////////////6Oj1/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/xUVmP+rq9r////////////////////////////////////////////09Pr/yMjn/6qq2v+Njc3/b2/A/2ZmvP9iYrr/VVW0/4SEyf////////////////+jo9f/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/zAwpP/j4/P////////////////////////////+/v//xcXm/3BwwP8zM6X/BASR/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/9OTrH/////////////////trbf/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/0tLsP/z8/r///////////////////////v7/f+bm9P/JCSf/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//HR2c//////////////////v7/f9SUrP/ERGW/xERlv8REZb/ERGW/xERlv8REZb/ERGW/xERlv//////////////////////6+v2/6ur2v8oKKH/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/2xsvv/8/P7//////////////////////8fH5v8oKKH/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj//W1u3/////////////////////////////////////////////////////////////////////////////////////////////////9fX7/2Njuv8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//BASR/5OT0P///////////////////////////4qKzP8DA5D/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//OTmo//39/v/////////////////////////////////////////////////////////////////////////////////////////////////8/P7/NDSm/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//DQ2V/7Oz3v///////////////////////Pz+/2trvv8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/9lZbv/9fX7/////////////////////////////////////////////////////////////////////////////////////////////////83N6f8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//PT2q/9ra7///////////////////////8fH5/0hIr/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/ykpof+np9j/5OTz//z8/v//////////////////////////////////////AACP/wAAj/8AAI//AQGP/1RUtP/9/f7/////////////////Jiag/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8mJqD/oqLW//39/v//////////////////////39/x/ywsov8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//vr7i/////////////////0pKr/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//CwuU/1pat/+yst3//Pz+////////////////////////////xcXm/xYWmf8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/7Cw3P////////////////9TU7P/AACP/wAAj/8AAI//AACP/wAAj/8WFpn/NTWm/1dXtf+Njc3/xsbm//j4/P/////////////////////////////////9/f7/k5PQ/wcHkv8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/+wsNz/////////////////3t7x/+bm9P/n5/T/4ODx/+Dg8f/29vv////////////////////////////////////////////////////////////S0uv/PDyp/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//sLDc//////////////////r6/f///////////////////////////////////////////////////////////////////////////83N6f9SUrP/AgKQ/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/7Cw3P/////////////////7+/3////////////////////////////////////////////////////////////b2+//hobK/y0to/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/+wsNz//////////////////Pz+///////////////////////////////////////S0uv/h4fK/09Psv8YGJr/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//tbXe/////////////////5eX0f+Kisz/oqLW/9nZ7v//////////////////////+/v9/zAwpP8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//HR2c//Dw+P////////////////81Nab/AACP/wAAj/8AAI//UlKz//Hx+f/////////////////AwOP/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//u7vh/7u74f+7u+H/u7vh/+3t9//////////////////q6vb/BASR/wAAj/8AAI//AACP/wAAj/9NTbH//////////////////////zU1pv8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/zk5qP+MjMz/qanZ/6qq2v+qqtr/qqra/6qq2v+qqtr/qqra/6qq2v+qqtr/qqra/6qq2v+qqtr/qqra/6qq2v+qqtr/qqra/6qq2v+qqtr/qqra/6qq2v+qqtr/qqra/6qq2v+YmNL/U1Oz/wICkP8AAI//AACP/wAAj/8AAI//AACP////////////////////////////////////////////YGC5/wAAj/8AAI//AACP/wAAj/8AAI//AACP/7a23/////////////////+np9j/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//CQmT/5GRz//+/v/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Gxub/IyOe/wAAj/8AAI//AACP/wAAj///////////////////////////////////////p6fY/wEBj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/9GRq7/////////////////+/v9/yAgnf8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/6+v3P///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////+Pj8/8ODpX/AACP/wAAj/8AAI/////////////////////////////u7vj/Zma8/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AQGP/9LS6/////////////////+Tk9D/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/1VVtP//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////lZXQ/wAAj/8AAI//AACP/0RErf9ERK3/RESt/0RErf81Nab/BQWR/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/9aWrf/////////////////+fn8/zQ0pv8AAI//AACP/wAAj/8AAI//AACP/wAAj/+1td7/////////////////0NDq/1xct/9VVbT/VVW0/1VVtP9VVbT/VVW0/1VVtP9VVbT/VVW0/1VVtP9VVbT/VVW0/1VVtP9VVbT/VVW0/1VVtP9VVbT/VVW0/1VVtP9VVbT/VVW0/1VVtP9WVrX/q6va//////////////////j4/P8NDZX/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//BASR/93d8P/////////////////r6/b/R0eu/wAAj/8AAI//AACP/wAAj/8AAI//5ub0/////////////////yYmoP8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wQEkf/e3vH/////////////////Nzen/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/9KSq///v7////////////////////////IyOf/d3fD/0RErf8oKKH/Hx+d//////////////////39/v8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//vLzi/////////////////0dHrv8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/4KCyP/////////////////////////////////////////////////////////////////9/f7/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/7u74f////////////////9ISK//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//eHjE//r6/f///////////////////////////////////////////////////////f3+/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/+7u+H/////////////////SEiv/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8vL6T/tLTe//z8/v////////////////////////////////////////////39/v8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//u7vh/////////////////0hIr/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8cHJv/Zma8/5mZ0v/Hx+b/19ft/+bm9P/////////////////9/f7/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/7u74f////////////////9ISK//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8FBZH//////////////////f3+/wEBj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/+8vOL/////////////////R0eu/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/+Li8v////////////////8tLaP/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8HB5L/4uLy/////////////////zY2p/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/+yst3/////////////////2trv/21tv/9mZrz/Zma8/2ZmvP9mZrz/Zma8/2ZmvP9mZrz/Zma8/2ZmvP9mZrz/Zma8/2ZmvP9mZrz/Zma8/2ZmvP9mZrz/Zma8/2ZmvP9mZrz/Zma8/2ZmvP9nZ7z/urrh//////////////////b2+/8KCpP/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//S0uw//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////+Kisz/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/+jo9f////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////a2u//CgqT/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//BASR/3d3w//6+v3///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////+4uOD/GRma/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//Kiqh/3p6xf+Xl9H/mZnS/5mZ0v+ZmdL/mZnS/5mZ0v+ZmdL/mZnS/5mZ0v+ZmdL/mZnS/5mZ0v+ZmdL/mZnS/5mZ0v+ZmdL/mZnS/5mZ0v+ZmdL/mZnS/5mZ0v+ZmdL/mZnS/4aGyv9DQ6z/AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/gAAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/gAAI/XAACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI/XAACPlwAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACPlwAAjzcAAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAjzcAAI8AAACPlwAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj5cAAI8AAACPAAAAjwAAAI+3AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj7cAAI8AAACPAAAAjwAAAI8AAACPAAAAj5cAAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj5cAAI8AAACPAAAAjwAAAI8AAACPAAAAjwAAAI8AAACPNwAAj5cAAI/XAACP+AAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI//AACP/wAAj/8AAI/XAACPlwAAjzcAAI8AAACPAAAAjwAAAI8A+AAAAAAAAB/gAAAAAAAAB8AAAAAAAAADgAAAAAAAAAGAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAAAAAAABgAAAAAAAAAHAAAAAAAAAA+AAAAAAAAAH+AAAAAAAAB8=")
#endregion Icon data

# Cree l'utilisateur Node-Red
Write-BoxstarterMessage -color Magenta "Cree l'utilisateur nodered"
if (-not (Get-LocalUser | Where-Object -Property Name -eq "nodered")) {
	# Cree l'utilisateur sans mot de passe
	New-LocalUser -Name "nodered" -Password (ConvertTo-SecureString "nodered" -AsPlainText -Force)
	Set-LocalUser -Name "nodered" -AccountNeverExpires -PasswordNeverExpires $true -UserMayChangePassword $false
}

# Cree D:\Services\node-red s'il n'existe pas deja
Write-BoxstarterMessage -color Magenta "Cree le dossier D:\services\node-red"
if (Test-Path -Path $nodered) {
    Move-Item -Path $nodered -Destination "$nodered.$(Get-Date -UFormat %s)"
}
New-Item -ItemType Directory -Force -Path "$nodered\workspace"
New-Item -ItemType Directory -Force -Path "$nodered\userdata"
New-Item -ItemType Directory -Force -Path "$nodered\node-red"
Push-Location -Path "$nodered\node-red"
npm install node-red
Pop-Location

# Ajoute l'icone au dossier
Set-ItemProperty -Path $nodered -Name Attributes -Value System
$DesktopIni = New-Item -Force -ItemType File -Path (Join-Path -Path $nodered -ChildPath "desktop.ini")
Add-Content -Path $DesktopIni.FullName -Value $DesktopIniContent
$DesktopIni.Attributes = 'System,Hidden'
$iconfile = (Join-Path -Path $nodered -ChildPath "nodered.ico")
[System.IO.File]::WriteAllBytes($iconfile, $iconData)

# Donne plein acces aux utilisateurs nodered et francois
$Account = [System.Security.Principal.NTAccount]"node-red"
$Acl = Get-Acl -Path $nodered
$Acl.SetOwner($Account)
Get-ChildItem -Recurse -Path $nodered | Set-Acl -AclObject $Acl
$AL = "francois", "FullControl", "ContainerInherit, ObjectInherit", "None", "Allow"
$FSAR = New-Object -ArgumentList $AL -TypeName "System.Security.AccessControl.FileSystemAccessRule"
$Acl.AddAccessRule($FSAR)
$Acl.SetAccessRuleProtection($false, $false)
Set-Acl -Path $nodered -AclObject $Acl

# Cree le service node-red a l'aide de nssm
if (Get-Service -Name `*node-red) { nssm remove *node-red confirm }
nssm install *node-red "powershell.exe"
nssm set *node-red AppParameters "$nodered\node-red\node_modules\.bin\node-red.ps1 -s $nodered\settings.js"
nssm set *node-red AppDirectory "$nodered\workspace"
nssm set *node-red AppExit Default Restart
nssm set *node-red AppPriority IDLE_PRIORITY_CLASS
nssm set *node-red AppStdout "$nodered\output.log"
nssm set *node-red AppStdoutCreationDisposition 2
nssm set *node-red AppStderr "$nodered\error.log"
nssm set *node-red AppStderrCreationDisposition 2
nssm set *node-red AppTimestampLog 1
nssm set *node-red AppStopMethodSkip 6
nssm set *node-red DisplayName "*node-red"
nssm set *node-red Description "Demarre/arrete le service node-red"
nssm set *node-red ObjectName .\node-red "nodered"
nssm set *node-red Start SERVICE_AUTO_START
nssm set *node-red Type SERVICE_WIN32_OWN_PROCESS

#endregion Main part


If (Test-PendingReboot) { Invoke-Reboot }
beep
