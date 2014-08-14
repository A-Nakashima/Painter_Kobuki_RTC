// -*- C++ -*-
/*!
 * @file  CorrorSelect.cpp
 * @brief ModuleDescription
 * @date $Date$
 *
 * $Id$
 */

#include "CorrorSelect.h"

// Module specification
// <rtc-template block="module_spec">
static const char* corrorselect_spec[] =
  {
    "implementation_id", "CorrorSelect",
    "type_name",         "CorrorSelect",
    "description",       "ModuleDescription",
    "version",           "1.0.0",
    "vendor",            "A.nakas",
    "category",          "Category",
    "activity_type",     "PERIODIC",
    "kind",              "DataFlowComponent",
    "max_instance",      "1",
    "language",          "C++",
    "lang_type",         "compile",
    // Configuration variables
    "conf.default.mode", "0",
    "conf.default.threshold1", "0.25",
    "conf.default.threshold2", "-0.08",
    "conf.default.threshold3", "0.2",
    "conf.default.threshold4", "-0.4",
    "conf.default.Judge_wait", "200",
    // Widget
    "conf.__widget__.mode", "text",
    "conf.__widget__.threshold1", "text",
    "conf.__widget__.threshold2", "text",
    "conf.__widget__.threshold3", "text",
    "conf.__widget__.threshold4", "text",
    "conf.__widget__.Judge_wait", "text",
    // Constraints
    ""
  };
// </rtc-template>

/*!
 * @brief constructor
 * @param manager Maneger Object
 */
CorrorSelect::CorrorSelect(RTC::Manager* manager)
    // <rtc-template block="initializer">
  : RTC::DataFlowComponentBase(manager),
    m_Kinect_SkeltonIn("Kinect_Skelton", m_Kinect_Skelton),
    m_corrorOut("corror", m_corror)

    // </rtc-template>
{
}

/*!
 * @brief destructor
 */
CorrorSelect::~CorrorSelect()
{
}



RTC::ReturnCode_t CorrorSelect::onInitialize()
{
  // Registration: InPort/OutPort/Service
  // <rtc-template block="registration">
  // Set InPort buffers
  addInPort("Kinect_Skelton", m_Kinect_SkeltonIn);
  
  // Set OutPort buffer
  addOutPort("corror", m_corrorOut);
  
  // Set service provider to Ports
  
  // Set service consumers to Ports
  
  // Set CORBA Service Ports
  
  // </rtc-template>

  // <rtc-template block="bind_config">
  // Bind variables and configuration variable
  bindParameter("mode", m_mode, "0");
  bindParameter("threshold1", m_threshold1, "0.25");
  bindParameter("threshold2", m_threshold2, "-0.08");
  bindParameter("threshold3", m_threshold3, "0.2");
  bindParameter("threshold4", m_threshold4, "-0.4");
  bindParameter("Judge_wait", m_Judge_wait, "200");
  
  // </rtc-template>
  return RTC::RTC_OK;
}

/*
RTC::ReturnCode_t CorrorSelect::onFinalize()
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CorrorSelect::onStartup(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CorrorSelect::onShutdown(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/


RTC::ReturnCode_t CorrorSelect::onActivated(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}


RTC::ReturnCode_t CorrorSelect::onDeactivated(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}

/* 
KinectRTCで表示される画面
閾値による領域選択区別 原点は領域５の中心当たり

	threshold3   threshold4
	　 ・		　 ・
	　 ・		　 ・
  1	   |	 4		|	 7
  	   |	 		|
-------+------------+--------- ・・・threshold1
	   |		  X |			
  2	   |	 5	  Λ|	 8
	   |	原点　｜	|
	   | Y＜------＋|
-------+------------+--------- ・・・threshold2
	   |			|
  3	   |	 6		|	 9

*/
int CorrorSelect::judgeShogen(float x, float y)
{
	if(y>m_threshold3)
	{
		if(x>m_threshold1) return 1;
		else if(x>m_threshold2) return 2;
		else return 3;
	}
	else if(y>m_threshold4)
	{
		if(x>m_threshold1) return 4;
		else if(x>m_threshold2) return 5;
		else return 6;
	}
	else
	{
		if(x>m_threshold1) return 7;
		else if(x>m_threshold2) return 8;
		else return 9;
	}
}

RTC::ReturnCode_t CorrorSelect::onExecute(RTC::UniqueId ec_id)
{
	float bef_handX, bef_handY;
	int oldShogen = 0;
	int counter;
	bool isCorrorSelected;
	if(m_Kinect_SkeltonIn.isNew())
	{
		isCorrorSelected = false;
		m_Kinect_SkeltonIn.read();
		bef_handX = m_Kinect_Skelton.data.x;
		bef_handY = m_Kinect_Skelton.data.y;
		oldShogen = judgeShogen(m_Kinect_Skelton.data.x, m_Kinect_Skelton.data.y);
		Sleep(m_Judge_wait);
		while(!m_Kinect_SkeltonIn.isEmpty()){m_Kinect_SkeltonIn.read();}
		while(m_Kinect_SkeltonIn.isEmpty()){};
		m_Kinect_SkeltonIn.read();
		if(oldShogen == judgeShogen(m_Kinect_Skelton.data.x, m_Kinect_Skelton.data.y))
		{	counter =12;std::cout<<"\nカウンターセット";}
		while(oldShogen == judgeShogen(m_Kinect_Skelton.data.x, m_Kinect_Skelton.data.y))
		{
			std::cout<<"\r選択："<<judgeShogen(m_Kinect_Skelton.data.x, m_Kinect_Skelton.data.y)<<"カウンター残り:"<<counter<<"		";
			if(counter >0) counter -=1;
			else 
			{
				m_corror.data = judgeShogen(m_Kinect_Skelton.data.x, m_Kinect_Skelton.data.y); 
				m_corrorOut.write();
				std::cout<<"\n\n領域選択選択:"<<m_corror.data;
				isCorrorSelected = true;
				break;
			}
			oldShogen =judgeShogen(m_Kinect_Skelton.data.x, m_Kinect_Skelton.data.y);
			while(m_Kinect_SkeltonIn.isEmpty()){};
			m_Kinect_SkeltonIn.read();

		}


	}
	else
	{
		m_corror.data = 0;
		m_corrorOut.write();
	}
  return RTC::RTC_OK;
}

/*
RTC::ReturnCode_t CorrorSelect::onAborting(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CorrorSelect::onError(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CorrorSelect::onReset(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CorrorSelect::onStateUpdate(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CorrorSelect::onRateChanged(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/



extern "C"
{
 
  void CorrorSelectInit(RTC::Manager* manager)
  {
    coil::Properties profile(corrorselect_spec);
    manager->registerFactory(profile,
                             RTC::Create<CorrorSelect>,
                             RTC::Delete<CorrorSelect>);
  }
  
};


