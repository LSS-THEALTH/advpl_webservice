#Include 'Protheus.ch'
#Include 'ApWebSRV.ch'

WsService xServerTime Description "Mostra HORA Atual"
	WsData HORARIO As String
	WsData PARAMETRO As String
	
	WsMethod MostraHora Description "Hor�rio de Bras�lia"
	
EndWsService

WsMethod MostraHora WsReceive PARAMETRO WsSend HORARIO WsService xServerTime
	Local lRet := .F.
	
	If PARAMETRO == "123456"
		::HORARIO := Time()
		lRet := .T.
	Else
		SetSoapFault("Method MostraHora n�o Dispon�vel", "Informar o param")
	Endif
	
Return lRet