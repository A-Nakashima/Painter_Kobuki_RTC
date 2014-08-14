// -*- C++ -*-
/*!
 * @file  Kinect_JointPoint.cpp
 * @brief ModuleDescription
 * @date $Date$
 *
 * $Id$
 */

#include "Kinect_JointPoint.h"

// Module specification
// <rtc-template block="module_spec">
static const char* kinect_jointpoint_spec[] =
  {
    "implementation_id", "Kinect_JointPoint",
    "type_name",         "Kinect_JointPoint",
    "description",       "ModuleDescription",
    "version",           "1.0.0",
    "vendor",            "VenderName",
    "category",          "Category",
    "activity_type",     "PERIODIC",
    "kind",              "DataFlowComponent",
    "max_instance",      "10",
    "language",          "C++",
    "lang_type",         "compile",
    // Configuration variables
    "conf.default.mode_out1", "7",
    "conf.default.mode_out2", "11",
    "conf.default.CoordinateSystem", "0",
    "conf.default.out1_xy_inverse", "1",
    "conf.default.out2_xy_inverse", "1",
    // Widget
    "conf.__widget__.mode_out1", "text",
    "conf.__widget__.mode_out2", "text",
    "conf.__widget__.CoordinateSystem", "text",
    "conf.__widget__.out1_xy_inverse", "text",
    "conf.__widget__.out2_xy_inverse", "text",
    // Constraints
    ""
  };
// </rtc-template>

/*!
 * @brief constructor
 * @param manager Maneger Object
 */
Kinect_JointPoint::Kinect_JointPoint(RTC::Manager* manager)
    // <rtc-template block="initializer">
  : RTC::DataFlowComponentBase(manager),
    m_Kinect_skeltonIn("Kinect_skelton", m_Kinect_skelton),
    m_out1Out("out1", m_out1),
    m_out2Out("out2", m_out2)

    // </rtc-template>
{
}

/*!
 * @brief destructor
 */
Kinect_JointPoint::~Kinect_JointPoint()
{
}



RTC::ReturnCode_t Kinect_JointPoint::onInitialize()
{
  // Registration: InPort/OutPort/Service
  // <rtc-template block="registration">
  // Set InPort buffers
  addInPort("Kinect_skelton", m_Kinect_skeltonIn);
  
  // Set OutPort buffer
  addOutPort("out1", m_out1Out);
  addOutPort("out2", m_out2Out);
  
  // Set service provider to Ports
  
  // Set service consumers to Ports
  
  // Set CORBA Service Ports
  
  // </rtc-template>

  // <rtc-template block="bind_config">
  // Bind variables and configuration variable
  bindParameter("mode_out1", m_mode_out1, "7");
  bindParameter("mode_out2", m_mode_out2, "11");
  bindParameter("CoordinateSystem", m_CoordinateSystem, "0");
  bindParameter("out1_xy_inverse", m_out1_xy_inverse, "1");
  bindParameter("out2_xy_inverse", m_out2_xy_inverse, "1");

  std::cout<<"Kinect_JointPointComp.exe : Initialize OK";
  // </rtc-template>
  return RTC::RTC_OK;
}

/*
RTC::ReturnCode_t Kinect_JointPoint::onFinalize()
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t Kinect_JointPoint::onStartup(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t Kinect_JointPoint::onShutdown(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

int counter;

RTC::ReturnCode_t Kinect_JointPoint::onActivated(RTC::UniqueId ec_id)
{
	std::cout<<"\nActivated";
	counter = 100;
	return RTC::RTC_OK;
}


RTC::ReturnCode_t Kinect_JointPoint::onDeactivated(RTC::UniqueId ec_id)
{
	return RTC::RTC_OK;
}


RTC::ReturnCode_t Kinect_JointPoint::onExecute(RTC::UniqueId ec_id)
{
	if(m_mode_out1 >20 || m_mode_out1<1 || m_mode_out2 > 20 || m_mode_out2 < 1)
	{
		std::cout<<"\n不正なコンフィギュレーション\nmode_outはそれぞれ１～２０で設定してください．";
		Sleep(2000);
		return RTC::RTC_OK;
	}

	if(m_Kinect_skeltonIn.isNew())
	{
		m_Kinect_skeltonIn.read();
		
		
		switch(m_CoordinateSystem)
		{
		case 0:
			m_out1.data.x = m_Kinect_skelton.data[(m_mode_out1-1)*3];
			m_out1.data.y = m_Kinect_skelton.data[(m_mode_out1-1)*3+1];
			m_out2.data.x = m_Kinect_skelton.data[(m_mode_out2-1)*3];
			m_out2.data.y = m_Kinect_skelton.data[(m_mode_out2-1)*3+1];
			break;
		case 1:
			m_out1.data.x = m_Kinect_skelton.data[(m_mode_out1-1)*3+1];
			m_out1.data.y = m_Kinect_skelton.data[(m_mode_out1-1)*3+2];
			m_out2.data.x = m_Kinect_skelton.data[(m_mode_out2-1)*3+1];
			m_out2.data.y = m_Kinect_skelton.data[(m_mode_out2-1)*3+2];
			break;
		case 2:
			m_out1.data.x = m_Kinect_skelton.data[(m_mode_out1-1)*3+2];
			m_out1.data.y = m_Kinect_skelton.data[(m_mode_out1-1)*3];
			m_out2.data.x = m_Kinect_skelton.data[(m_mode_out2-1)*3+2];
			m_out2.data.y = m_Kinect_skelton.data[(m_mode_out2-1)*3];
			break;
		}
		if(m_out1_xy_inverse != 0)
		{
			float tmp = m_out1.data.x;
			m_out1.data.x = m_out1.data.y;
			m_out1.data.y = -tmp;
		}
		if(m_out2_xy_inverse != 0)
		{
			float tmp = m_out2.data.x;
			m_out2.data.x = m_out2.data.y;
			m_out2.data.y = -tmp;
		}
		
		m_out1Out.write();
		m_out2Out.write();
		//if(counter==0)
		//{
		//	//std::cout<<"\nout1: data["<<m_mode_out1<<"](x,y) = ("<<m_out1.data.x<<", "<<m_out1.data.y<<")";
		//	//std::cout<<"\nout2: data["<<m_mode_out2<<"](x,y) = ("<<m_out2.data.x<<", "<<m_out2.data.y<<")";
		//	counter = 100;
		//}
		//else counter --;
		
	}
  return RTC::RTC_OK;
}


/*
RTC::ReturnCode_t Kinect_JointPoint::onAborting(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t Kinect_JointPoint::onError(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t Kinect_JointPoint::onReset(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t Kinect_JointPoint::onStateUpdate(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t Kinect_JointPoint::onRateChanged(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/



extern "C"
{
 
  void Kinect_JointPointInit(RTC::Manager* manager)
  {
    coil::Properties profile(kinect_jointpoint_spec);
    manager->registerFactory(profile,
                             RTC::Create<Kinect_JointPoint>,
                             RTC::Delete<Kinect_JointPoint>);
  }
  
};


