param ($name = "Archivdatei",
    $folder = "D:\Dropbox\Work\LGT\pdf\",
      $titel = "Hellouuuu",
      $text1 = "sss",
      $text2 = "333",
      $text3 = "4234svs#$")

# libraries
Add-Type -Path "D:\Dropbox\Work\LGT\pdf\Common.Logging.Core.3.4.1\lib\net40\Common.Logging.Core.dll"
Add-Type -Path "D:\Dropbox\Work\LGT\pdf\Common.Logging.3.4.1\lib\net35\Common.Logging.dll"
Add-Type -Path "D:\Dropbox\Work\LGT\pdf\BouncyCastle.1.8.9\lib\BouncyCastle.Crypto.dll"
Add-Type -Path "D:\Dropbox\Work\LGT\pdf\itext7.7.1.14\lib\net40\itext.io.dll"
Add-Type -Path "D:\Dropbox\Work\LGT\pdf\itext7.7.1.14\lib\net40\itext.kernel.dll"
Add-Type -Path "D:\Dropbox\Work\LGT\pdf\itext7.7.1.14\lib\net40\itext.layout.dll"


[string] $pdfDocuFilename = $folder + $name + '_' +(Get-Date -Format "yyyyMMdd_HHmmss") + ".pdf"


# initialize
$pdfWriter = [iText.Kernel.Pdf.PdfWriter]::new($pdfDocuFilename)
$pdf = [iText.Kernel.Pdf.PdfDocument]::new($pdfWriter)

# Create the Layout Document
$LayoutDocument = [iText.Layout.Document]::New($pdf)

# Create some text
$MyText = [iText.Layout.Element.Text]::new($titel)
$Textobj1 = [iText.Layout.Element.Text]::new($text1)
$Textobj2 = [iText.Layout.Element.Text]::new($text2)
$Textobj3 = [iText.Layout.Element.Text]::new($text3)

# Create a Paragraph and adding metadata for better overview
$LayoutParagraph = [iText.Layout.Element.Paragraph]::New($MyText)

# Create a List and adding metadata for better overview
$TextList = [iText.Layout.Element.List]::New()
$TextList.add($text1)
$TextList.add($text2)
$TextList.add($text3)

# Add the data to the Document
$LayoutDocument.Add($LayoutParagraph)
$LayoutDocument.Add($TextList)

$pdf.Close()
