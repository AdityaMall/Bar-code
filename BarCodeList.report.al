// report 50101 BarcodeList
// {
//     Caption = 'Barcode List Report';
//     UsageCategory = Administration;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = '.\Report\BarcodeList.rdl';
//     dataset
//     {
//         dataitem("Sales Header"; "Sales Header")
//         {
//             column(No_; "No.")
//             {

//             }
//             column(temp; temp.blob)
//             {

//             }
//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 Barcode.DoGenerateBarcode("Sales Header"."No.", 5, temp);
//             end;
//         }
//     }

//     var
//         temp1: Record TempBlob;
//         temp: Codeunit "Temp Blob";
//         Barcode: Codeunit Barcode;
// }