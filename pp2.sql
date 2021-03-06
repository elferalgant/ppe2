USE [master]
GO
/****** Object:  Database [indecis]    Script Date: 28/05/2021 21:13:04 ******/
CREATE DATABASE [indecis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'indecis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\indecis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'indecis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\indecis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [indecis] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [indecis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [indecis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [indecis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [indecis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [indecis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [indecis] SET ARITHABORT OFF 
GO
ALTER DATABASE [indecis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [indecis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [indecis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [indecis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [indecis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [indecis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [indecis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [indecis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [indecis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [indecis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [indecis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [indecis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [indecis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [indecis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [indecis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [indecis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [indecis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [indecis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [indecis] SET  MULTI_USER 
GO
ALTER DATABASE [indecis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [indecis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [indecis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [indecis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [indecis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [indecis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [indecis] SET QUERY_STORE = OFF
GO
USE [indecis]
GO
/****** Object:  Table [dbo].[CLIENT]    Script Date: 28/05/2021 21:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENT](
	[idClient] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](32) NOT NULL,
	[Prenom] [varchar](32) NULL,
	[Mail] [varchar](64) NOT NULL,
	[dateInscription] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[homonyne]    Script Date: 28/05/2021 21:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[homonyne]
AS
SELECT CLIENT_1.Mail, dbo.CLIENT.idClient
FROM     dbo.CLIENT INNER JOIN
                  dbo.CLIENT AS CLIENT_1 ON dbo.CLIENT.Nom = CLIENT_1.Nom AND dbo.CLIENT.Prenom = CLIENT_1.Prenom
GO
/****** Object:  Table [dbo].[ETAT]    Script Date: 28/05/2021 21:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETAT](
	[idEtat] [int] IDENTITY(1,1) NOT NULL,
	[Libelle] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEtat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JEU]    Script Date: 28/05/2021 21:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JEU](
	[idJeu] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](125) NOT NULL,
	[Editeur] [varchar](50) NOT NULL,
	[trancheAgeMin] [int] NOT NULL,
	[trancheAgeMax] [int] NOT NULL,
	[nbJoueursMin] [int] NOT NULL,
	[nbJoueursMax] [int] NOT NULL,
	[idEtat] [int] NOT NULL,
	[idStatut] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idJeu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVATION]    Script Date: 28/05/2021 21:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESERVATION](
	[idReservation] [int] IDENTITY(1,1) NOT NULL,
	[dateEmprunt] [date] NOT NULL,
	[dateRetour] [date] NULL,
	[dateRendu] [date] NULL,
	[idJeu] [int] NOT NULL,
	[idClient] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idReservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_reserved]    Script Date: 28/05/2021 21:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [dbo].[view_reserved] AS 
SELECT 
	J.Nom as GameName, 
	C.Nom + ' ' + C.Prenom as Client, 
	R.dateEmprunt as DateEmprunt,
	DATEDIFF(DD, GETDATE(), R.dateEmprunt) as DaysSinceReservation,
	E.Libelle as Etat,
	R.idReservation as idReservation
FROM 
	ETAT E JOIN JEU J ON E.idEtat = J.idEtat
	JOIN RESERVATION R ON J.idJeu = R.idJeu
	JOIN CLIENT C ON R.idClient = C.idClient
WHERE
	R.dateRendu IS NULL;
GO
/****** Object:  View [dbo].[view_past_reserved]    Script Date: 28/05/2021 21:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[view_past_reserved] AS 
SELECT 
	J.Nom as GameName, 
	C.Nom + ' ' + C.Prenom as Client, 
	R.dateEmprunt as DateEmprunt,
	DATEDIFF(DD, GETDATE(), R.dateEmprunt) as DaysSinceReservation,
	R.dateRendu as Rendu,
	E.Libelle as Etat
FROM 
	ETAT E JOIN JEU J ON E.idEtat = J.idEtat
	JOIN RESERVATION R ON J.idJeu = R.idJeu
	JOIN CLIENT C ON R.idClient = C.idClient
WHERE
	R.dateRendu IS NOT NULL;
GO
/****** Object:  Table [dbo].[Appartenir]    Script Date: 28/05/2021 21:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appartenir](
	[idCategorie] [int] NOT NULL,
	[idJeu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategorie] ASC,
	[idJeu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIE]    Script Date: 28/05/2021 21:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIE](
	[idCategorie] [int] IDENTITY(1,1) NOT NULL,
	[Libelle] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATUT]    Script Date: 28/05/2021 21:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATUT](
	[idStatut] [int] IDENTITY(1,1) NOT NULL,
	[Libelle] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idStatut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appartenir]  WITH CHECK ADD FOREIGN KEY([idCategorie])
REFERENCES [dbo].[CATEGORIE] ([idCategorie])
GO
ALTER TABLE [dbo].[Appartenir]  WITH CHECK ADD FOREIGN KEY([idJeu])
REFERENCES [dbo].[JEU] ([idJeu])
GO
ALTER TABLE [dbo].[JEU]  WITH CHECK ADD FOREIGN KEY([idEtat])
REFERENCES [dbo].[ETAT] ([idEtat])
GO
ALTER TABLE [dbo].[JEU]  WITH CHECK ADD FOREIGN KEY([idStatut])
REFERENCES [dbo].[STATUT] ([idStatut])
GO
ALTER TABLE [dbo].[RESERVATION]  WITH CHECK ADD FOREIGN KEY([idClient])
REFERENCES [dbo].[CLIENT] ([idClient])
GO
ALTER TABLE [dbo].[RESERVATION]  WITH CHECK ADD FOREIGN KEY([idJeu])
REFERENCES [dbo].[JEU] ([idJeu])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CLIENT"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CLIENT_1"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2892
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'homonyne'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'homonyne'
GO
USE [master]
GO
ALTER DATABASE [indecis] SET  READ_WRITE 
GO
