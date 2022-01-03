report 50122 ItemBarcodeReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Item Barcodes';
    RDLCLayout = './ItemBarcodes.rdl';

    dataset
    {
        dataitem(Items; Item)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Items';

            column(No_; "No.")
            {
            }
            column(Description; Description)
            {
            }

            column(Unit_Cost; "Unit Cost")
            {
            }

            column(EncodedText; EncodedText)
            {

            }

            // trigger OnAfterGetRecord()
            // begin
            //     EncodedText := BARcodeunit.CreateBarcode("No.");
            //     BARcodeunit.Run();
            // end;
            trigger OnAfterGetRecord()
            var
                barcodesymbology: enum "Barcode Symbology";
                barcodefontprovider: Interface "Barcode Font Provider";
                BarcodeString: Text;
            begin
                if Items.GTIN = '' then exit;
                barcodefontprovider := Enum::"Barcode Font Provider"::IDAutomation1D;
                barcodesymbology := Enum::"Barcode Symbology"::Code39;
                BarcodeString := Items.GTIN;
                barcodefontprovider.ValidateInput(BarcodeString, barcodesymbology);
                EncodedText := barcodefontprovider.EncodeFont(BarcodeString, barcodesymbology);
            end;
        }
    }


    var
        EncodedText: Text;
        BarCode: Text;
        BARcodeunit: Codeunit BarCodeCodeunit;




}