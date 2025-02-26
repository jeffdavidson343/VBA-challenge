VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Sub YearlyChange()

'Part 2, Yearly Change
'Define Variable types
Dim OP As Double
Dim CP As Double
Dim i As Long
Dim Yearly As Double
Dim LR As Long
Dim x As Integer
Dim Total As Double

  
'For understanding LR = Last Row
Cells(1, 9) = "Ticker"
Cells(1, 10) = "Yearly Change"
Cells(1, 11) = "Percent Change"
Cells(1, 12) = "Total Stock Volume"
Range("o2") = "Greatest % Increase"
Range("o3") = "Greatest % Decrease"
Range("o4") = "Greatest Total Volume"
Range("p1") = "Ticker"
Range("q1") = "Value"
LR = Cells(Rows.Count, 1).End(xlUp).Row
OP = Cells(2, 3).Value

x = 2

'Create for loop
'Loop through rows, to get opening price
For i = 2 To LR
    Total = Cells(i, 7).Value + Total
    
    If Cells(i, 1).Value <> Cells(i + 1, 1).Value Then
    
    
    CP = Cells(i, 6).Value
    Final = CP - OP
   
    Cells(x, 10).Value = Final
         If OP = 0 Then
            Cells(x, 11).Value = 0
            Else
            Cells(x, 11).Value = (Final / OP)
         End If
    OP = Cells(i + 1, 3).Value
    
    Cells(x, 12).Value = Total
    Cells(x, 9).Value = Cells(i, 1).Value
    
    Total = 0
    x = x + 1
    
    End If
    
Next i

'Calculate the max percentage
Range("q2") = WorksheetFunction.Max(Range("k2:k" & LR))

'Calculate the minimum percentage
Range("q3") = WorksheetFunction.Min(Range("k2:k" & LR))

'Calculate the highest total value
Range("q4").Value = WorksheetFunction.Max(Range("L2:L" & LR).Value)

'Match the tickers to values we got
GVRow = WorksheetFunction.Match(Range("q4").Value, Range("l1:l" & LR), 0)
Range("p4") = Range("i" & GVRow)

'% decrease
GVRow1 = WorksheetFunction.Match(Range("q3").Value, Range("k1:k" & LR), 0)
Range("p3") = Range("i" & GVRow1)

'% increase
GVRow2 = WorksheetFunction.Match(Range("q2").Value, Range("k1:k" & LR), 0)
Range("p2") = Range("i" & GVRow2)


End Sub

