﻿Public Class PaymentMethod_From
    Private Sub Exit_Button_Click(sender As Object, e As EventArgs) Handles Exit_Button.Click
        Me.Close()
    End Sub

    Private Sub Purchase_Button_Click(sender As Object, e As EventArgs) Handles Purchase_Button.Click
        If AmericanExpress_RadioButton.Checked AndAlso Visa_RadioButton.Checked AndAlso MasterCard_RadioButton.Checked = False Then
            MsgBox("Please select payment method.")
        ElseIf AmericanExpress_RadioButton.Checked = True AndAlso Visa_RadioButton.Checked = False AndAlso MasterCard_RadioButton.Checked = False Then
            AmericanExpress_Form.Show()
            Me.Hide()
        ElseIf Visa_RadioButton.Checked = True AndAlso AmericanExpress_RadioButton.Checked = False AndAlso MasterCard_RadioButton.Checked = False Then
            VisaCard_Form.Show()
            Me.Hide()
        ElseIf MasterCard_RadioButton.Checked = True AndAlso AmericanExpress_RadioButton.Checked = False AndAlso Visa_RadioButton.Checked = False Then
            MasterCard_Form.Show()
            Me.Hide()
        End If
    End Sub
End Class