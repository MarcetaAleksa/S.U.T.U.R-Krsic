﻿Public Class UnosRadnika
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles UR_ChangePicture_Button.Click
        UR_OpenFileDialog.InitialDirectory = UR_FolderBrowserDialog.SelectedPath
        UR_OpenFileDialog.ShowDialog() 'ovaj klik je na dugme za unos slike, tj kao Browse Picture, ili Choose image i sl, to je taj button
    End Sub

    Private Sub OpenFileDialog1_FileOk(sender As Object, e As System.ComponentModel.CancelEventArgs) Handles UR_OpenFileDialog.FileOk
        Dim myPic As Bitmap
        myPic = New Bitmap(UR_OpenFileDialog.FileName) 'preko ovog unosimo sliku, nasao ja na netu
        UR_Picture.Image = myPic
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles UR_Timer.Tick
        If UR_Picture.Image IsNot Nothing Then 'Ovo sam napravio ako korisnik nema sliku da mu izbaci odmah NO FILE, a kada je UBAVI hah onda da nam taj label nestane.
            UR_NoFile_Label.Visible = False 'a timer sam koristio kako bi se stalno provjeravalo je l ima slika ili nema
            UR_ClearImage_Button.Visible = True
        Else
            UR_NoFile_Label.Visible = True
            UR_ClearImage_Button.Visible = False
        End If
        If UR_Male_Button.Checked = True Then
            UR_Female_Button.Checked = False
        Else
            UR_Female_Button.Checked = True
        End If
    End Sub

    Private Sub UR_ClearImage_Button_Click(sender As Object, e As EventArgs) Handles UR_ClearImage_Button.Click
        UR_Picture.Image = Nothing 'dugme koje se pojavi samo ako postoji slika i koje brise sliku hehehhehehe
    End Sub
End Class