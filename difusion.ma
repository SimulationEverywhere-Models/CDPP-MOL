#include(mol.inc)

[top]
components : difusion

[difusion]
type : cell
dim : (20,200) % (N, M), cambiar en mol.inc
delay : transport
defaultDelayTime : 100
border : nowrapped
neighbors : difusion(-1,-1) 
neighbors : difusion(0,-1) difusion(0,0)
neighbors : difusion(1,-1) 
localtransition : ecuaciones
initialValue : 0

[ecuaciones]
% primera columna: valor inicial ui(0), i = cellpos(0)
rule : { 0 } 1 { cellpos(0) = (#Macro(N) - 1) and cellpos(1) = 0 } 
rule : { 100 * sin( PI * cellpos(0) * #Macro(DX) ) } 1 { cellpos(1) = 0 }
% u0(t), t = cellpos(1)

rule : { 0 } 1 { cellpos(0) = 0 or cellpos(0) = (#Macro(N) - 1) }
rule : { (0,-1) + ( #Macro(DT) / ( #Macro(DX) * #Macro(DX) ) ) * ( (-1,-1) - 2 * (0,-1) + (1,-1) ) } 1 { t }