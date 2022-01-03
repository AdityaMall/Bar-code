codeunit 50133 BarCodeCodeunit
{
    procedure CreateBarcode(ItemNo: Text): Text
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        TypeHelper: Codeunit "Type Helper";
        client: HttpClient;
        response: HttpResponseMessage;
        InStr: InStream;

    begin
        client.Get('https://barcode.tec-it.com/barcode.ashx?data=' + TypeHelper.UrlEncode(BarCode) + '&code=Code128&translate-esc=on&imagetype=Jpg', response);
        TempBlob.CreateInStream(InStr);
        response.Content().ReadAs(InStr);
        BarCode := Base64Convert.ToBase64(InStr);
        exit(BarCode);
    end;

    var
        BarCode: Text;
}