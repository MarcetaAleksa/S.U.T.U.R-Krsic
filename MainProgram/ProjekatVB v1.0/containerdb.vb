﻿Imports System.Data.SqlClient
Public Class containerdb
    'otvaranje konekcije sa bazom 
    'Spartan (Panzic), SPARTAN (Aleksa)
    Public Shared connection As New SqlConnection("SERVER = SPARTAN\SQLEXPRESS; Database = S.U.T.U.R_Krsic; Integrated Security = true")
End Class
