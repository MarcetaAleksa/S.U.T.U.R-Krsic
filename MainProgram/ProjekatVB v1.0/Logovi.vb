﻿Imports System.Data.SqlClient
Public Class logovi
    Public Shared Sub Log()
        ' Dim Log_File As System.IO.StreamWriter
        Dim Log_Date As String
        Log_Date = Date.Now.ToString("yyyy-MM-dd hh:mm:ss")

        'promjeniti ime korisnika na Aleksandar ili Aleksa (c:\Users\(jedno od ponudjenih imena)\...)
        'Log_File = My.Computer.FileSystem.OpenTextFileWriter("C:\\Users\\" + Podesavanja.OvoJeNalog + "\\Documents\\GitHub\\S.U.T.U.R-Krsic\\MainProgram\\ProjekatVB v1.0\\bin\\Logs\\Login\\Logs.txt", True)
        'Log_File.WriteLine("Username: " + Prijava.Username_Form_Box.Text + ";; Password: " + Prijava.Password_Form_Box.Text + ";; Date of Attempt: " + Log_Date)
        'Log_File.Close()
        Try
            containerdb.connection.Open()
            Dim command As New SqlCommand("Insert INTO log_prijavljivanje(Korisnik, Lozinka, Datum, Prijava) Values('" & Prijava.Username_Form_Box.Text & "','" & Prijava.Password_Form_Box.Text & "','" & Log_Date & "', 1)", containerdb.connection)
            'uspjesna prijava, dodaj u bazu
            command.ExecuteNonQuery()
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        Finally
            containerdb.connection.Close()
        End Try


    End Sub
    Public Shared Sub FailedLog()
        'Dim Failed_Log As System.IO.StreamWriter
        Dim Log_Date As String
        Log_Date = Date.Now.ToString("yyyy-MM-dd hh:mm:ss")

        'promjeniti ime korisnika na Aleksandar ili Aleksa (c:\Users\(jedno od ponudjenih imena)\...)
        'Failed_Log = My.Computer.FileSystem.OpenTextFileWriter("C:\\Users\\" + Podesavanja.OvoJeNalog + "\\Documents\\GitHub\\S.U.T.U.R-Krsic\\MainProgram\\ProjekatVB v1.0\\bin\\Logs\\Login\\FailedLogs.txt", True)
        'Failed_Log.WriteLine("Username: " + Prijava.Username_Form_Box.Text + ";; Password: " + Prijava.Password_Form_Box.Text + ";; Date of Attempt: " + Log_Date)
        'Failed_Log.Close()
        Try
            containerdb.connection.Open()
            Dim command As New SqlCommand("INSERT INTO log_prijavljivanje(Korisnik, Lozinka, Datum, Prijava) Values('" & Prijava.Username_Form_Box.Text & "','" & Prijava.Password_Form_Box.Text & "','" & Log_Date & "', 0)", containerdb.connection)
            command.ExecuteNonQuery()
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        Finally
            containerdb.connection.Close()
        End Try


        'neuspjesna prijava, dodaj u bazu


    End Sub
    Public Shared Sub BrisanjeKorisnika()
        ' Dim Brisanje_Korisnika As System.IO.StreamWriter
        Dim Brisanje_Datum As String
        Brisanje_Datum = Date.Now.ToString("yyyy-MM-dd hh:mm:ss")
        'Try
        '    Brisanje_Korisnika = My.Computer.FileSystem.OpenTextFileWriter("C:\\Users\\" + Podesavanja.OvoJeNalog + "\\Documents\\GitHub\\S.U.T.U.R-Krsic\\MainProgram\\ProjekatVB v1.0\\bin\\Logs\\Users\\ObrisaniKorisnici.txt", True)
        '    Brisanje_Korisnika.WriteLine("Admin: " + Prijava.Username_Form_Box.Text + ";; Obrisani korisnik: " + PretragaRadnika.U_Username_TextBox.Text + ";; Datum i vrijeme brisanja: " + Brisanje_Datum)
        '    Brisanje_Korisnika.Close()
        'Catch
        'End Try

        Try
            containerdb.connection.Open()
            Dim command As New SqlCommand("INSERT INTO log_korisnici (Nadlezni, Korisnik, Datum, Unos) Values('" & Prijava.Username_Form_Box.Text & "','" & PretragaRadnika.U_Username_TextBox.Text & "','" & Brisanje_Datum & "', 0)", containerdb.connection)
            command.ExecuteNonQuery()
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        Finally
            containerdb.connection.Close()
        End Try
        'izbrisani korisnik, dodaj u bazu


    End Sub

    Public Shared Sub DodavanjeKorisnika()
        ' Dim Dodavanje_Korisnika As System.IO.StreamWriter
        Dim Dodavanje_Datum As String
        Dodavanje_Datum = Date.Now.ToString("yyyy-MM-dd hh:mm:ss")
        'Try
        '    Dodavanje_Korisnika = My.Computer.FileSystem.OpenTextFileWriter("C:\\Users\\" + Podesavanja.OvoJeNalog + "\\Documents\\GitHub\\S.U.T.U.R-Krsic\\MainProgram\\ProjekatVB v1.0\\bin\\Logs\\Users\\DodaniKorisnici.txt", True)
        '    Dodavanje_Korisnika.WriteLine("Admin: " + Prijava.Username_Form_Box.Text + ";; Dodani korisnik: " + UnosRadnika.UR_Username_TextBox.Text + ";; Ime i prezime: " + UnosRadnika.UR_Name_TextBox.Text + " " + UnosRadnika.UR_Surname_TextBox.Text + ";;Email:" + UnosRadnika.UR_Email_TextBox.Text + ";; Datum i vrijeme dodavanja: " + Dodavanje_Datum)
        '    Dodavanje_Korisnika.Close()
        'Catch
        'End Try

        Try
            containerdb.connection.Open()
            Dim command As New SqlCommand("INSERT INTO log_korisnici (Nadlezni, Korisnik, Datum, Unos) Values('" & Prijava.Username_Form_Box.Text & "','" & UnosRadnika.UR_Username_TextBox.Text & "','" & Dodavanje_Datum & "', 1)", containerdb.connection)
            command.ExecuteNonQuery()
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        Finally
            containerdb.connection.Close()
        End Try
        'dodani korisnik, dodaj u bazu


    End Sub

End Class
