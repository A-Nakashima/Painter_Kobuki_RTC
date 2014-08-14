// -*- C++ -*-
/*!
 * @file  Point2DtoPose2D.cpp
 * @brief ModuleDescription
 * @date $Date$
 *
 * $Id$
 */

#include "Point2DtoPose2D.h"

// Module specification
// <rtc-template block="module_spec">
static const char* point2dtopose2d_spec[] =
  {
    "implementation_id", "Point2DtoPose2D",
    "type_name",         "Point2DtoPose2D",
    "description",       "ModuleDescription",
    "version",           "1.0.0",
    "vendor",            "VenderName",
    "category",          "Category",
    "activity_type",     "PERIODIC",
    "kind",              "DataFlowComponent",
    "max_instance",      "1",
    "language",          "C++",
    "lang_type",         "compile",
    // Configuration variables
    "conf.default.mode", "0",
    "conf.default.gain", "1",
    // Widget
    "conf.__widget__.mode", "text",
    "conf.__widget__.gain", "text",
    // Constraints
    ""
  };
// </rtc-template>

/*!
 * @brief constructor
 * @param manager Maneger Object
 */
Point2DtoPose2D::Point2DtoPose2D(RTC::Manager* manager)
    // <rtc-template block="initializer">
  : RTC::DataFlowComponentBase(manager),
    m_inIn("in", m_in),
    m_outOut("out", m_out)

    // </rtc-template>
{
}

/*!
 * @brief destructor
 */
Point2DtoPose2D::~Point2DtoPose2D()
{
}



RTC::ReturnCode_t Point2DtoPose2D::onInitialize()
{
  // Registration: InPort/OutPort/Service
  // <rtc-template block="registration">
  // Set InPort buffers
  addInPort("in", m_inIn);
  
  // Set OutPort buffer
  addOutPort("out", m_outOut);
  
  // Set service provider to Ports
  
  // Set service consumers to Ports
  
  // Set CORBA Service Ports
  
  // </rtc-template>

  // <rtc-template block="bind_config">
  // Bind variables and configuration variable
  bindParameter("mode", m_mode, "0");
  bindParameter("gain", m_gain, "1");
  
  // </rtc-template>
  return RTC::RTC_OK;
}

/*
RTC::ReturnCode_t Point2DtoPose2D::onFinalize()
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t Point2DtoPose2D::onStartup(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t Point2DtoPose2D::onShutdown(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/


RTC::ReturnCode_t Point2DtoPose2D::onActivated(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}


RTC::ReturnCode_t Point2DtoPose2D::onDeactivated(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}


RTC::ReturnCode_t Point2DtoPose2D::onExecute(RTC::UniqueId ec_id)
{
	if(m_inIn.isNew())
	{
		m_inIn.read();
		m_out.data.position.x = m_in.data.x*m_gain;
		m_out.data.position.y = m_in.data.y*m_gain;
		m_out.data.heading = 0;
		m_outOut.write();
	}
  return RTC::RTC_OK;
}

/*
RTC::ReturnCode_t Point2DtoPose2D::onAborting(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t Point2DtoPose2D::onError(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t Point2DtoPose2D::onReset(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t Point2DtoPose2D::onStateUpdate(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t Point2DtoPose2D::onRateChanged(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/



extern "C"
{
 
  void Point2DtoPose2DInit(RTC::Manager* manager)
  {
    coil::Properties profile(point2dtopose2d_spec);
    manager->registerFactory(profile,
                             RTC::Create<Point2DtoPose2D>,
                             RTC::Delete<Point2DtoPose2D>);
  }
  
};


