//+------------------------------------------------------------------+
//|                                   Copyright 2018, Erlon F. Souza |
//|                                       https://github.com/erlonfs |
//+------------------------------------------------------------------+

#property copyright "Copyright 2018, Erlon F. Souza"
#property link      "https://github.com/erlonfs"
#property version    "1.0.0"

#include <BadRobot.Framework\BadRobotCore.mqh>

class BadRobotPrompt : public BadRobotCore
{
	private:
		
		
	protected:
	
	void ShowInfo()
	{					
		if(!IsRewrite()) return;

		Comment("--------------------------------------" +
			"\n" + GetRobotName() + " " + ToPeriodText(GetPeriod()) + " " + GetRobotVersion() + "\nFRAMEWORK " + version +
			(GetLastTextInfo() != NULL ? "\n--------------------------------------\n" + GetLastTextInfo() : "") +
			
			(!IsModeAlert() ?
			   "\n--------------------------------------" +
   			"\nPOSIÇÃO " + GetPositionVolumeText() +
   			"\nTP " + DoubleToString(ToPoints(GetStopGain()), _Digits) + " SL " + DoubleToString(ToPoints(GetStopLoss()), _Digits)
   			: "\nMODO ALERTA ATIVADO"
			) + "\n--------------------------------------" +
			
			(IsStopOnLastCandle() ? "\nSTOP CANDLE ANTERIOR " + ToPeriodText(GetPeriodStopOnLastCandle()) : "") +
			
			(IsTrailingStop() ? "\nTRAILING STOP " + DoubleToString(GetPositionType() == POSITION_TYPE_SELL ? 
			                                                 GetPositionPriceOpen() - ToPoints(GetTrailingStopInicio()) : 
			                                                 GetPositionPriceOpen() + ToPoints(GetTrailingStopInicio()), _Digits) + " " + DoubleToString(ToPoints(GetTrailingStop()), _Digits) : "") +
			                                                 
			(IsBreakEven() ? "\nBREAK EVEN " + (IsBreakEvenExecuted() ? "" : DoubleToString((GetPositionType() == POSITION_TYPE_SELL ? 
			                                                                        GetPositionPriceOpen() - GetBreakEven() :
			                                                                        GetPositionPriceOpen() + GetBreakEven()), _Digits)) : "") +
			(IsParcial() ? "\nPARCIAL " + 
				(!IsPrimeiraParcialExecuted() && GetPrimeiraParcialInicio() > 0 ? DoubleToString((GetPositionType() == POSITION_TYPE_SELL ? 
				                                                                     GetPositionPriceOpen() - ToPoints(GetPrimeiraParcialInicio()) : 
				                                                                     GetPositionPriceOpen() + ToPoints(GetPrimeiraParcialInicio())), _Digits) + " " + (string)GetPrimeiraParcialVolume() + " " : "") +
				                                                                     
				(!IsSegundaParcialExecuted() && GetSegundaParcialInicio() > 0 ? " | " + DoubleToString((GetPositionType() == POSITION_TYPE_SELL ? 
				                                                                           GetPositionPriceOpen() - ToPoints(GetSegundaParcialInicio()) : 
				                                                                           GetPositionPriceOpen() + ToPoints(GetSegundaParcialInicio())), _Digits) + " " + (string)GetSegundaParcialVolume() + " " : "") +
				                                                                           
				(!IsTerceiraParcialExecuted() && GetTerceiraParcialInicio() > 0 ? " | " + DoubleToString((GetPositionType() == POSITION_TYPE_SELL ? 
				                                                                             GetPositionPriceOpen() - ToPoints(GetTerceiraParcialInicio()) : 
				                                                                             GetPositionPriceOpen() + ToPoints(GetTerceiraParcialInicio())), _Digits) + " " + (string)GetTerceiraParcialVolume() + " "  : "") 
			: "") +
			
			(IsGerenciamentoFinanceiro() ? "\nPROFIT " + (string)GetTotalLucro() : "") +
			
			"\n--------------------------------------" +

			("\n" + GetLogger().Get()));

	}
		
	public:
	
		BadRobotPrompt(){
					
		}					
};