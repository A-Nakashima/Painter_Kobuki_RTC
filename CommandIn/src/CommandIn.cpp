// -*- C++ -*-
/*!
 * @file  CommandIn.cpp
 * @brief Command Input Sample for GRobotRTC
 * @date $Date$
 *
 * $Id$
 */

#include "CommandIn.h"

// Module specification
// <rtc-template block="module_spec">
static const char* commandin_spec[] =
  {
    "implementation_id", "CommandIn",
    "type_name",         "CommandIn",
    "description",       "Command Input Sample for GRobotRTC",
    "version",           "1.0.0",
    "vendor",            "AIST",
    "category",          "Sampl",
    "activity_type",     "PERIODIC",
    "kind",              "DataFlowComponent",
    "max_instance",      "1",
    "language",          "C++",
    "lang_type",         "compile",
    ""
  };
// </rtc-template>

/*!
 * @brief constructor
 * @param manager Maneger Object
 */
CommandIn::CommandIn(RTC::Manager* manager)
    // <rtc-template block="initializer">
  : RTC::DataFlowComponentBase(manager),
    m_inputIn("input", m_input),
    m_commandOut("command", m_command)

    // </rtc-template>
{
}

/*!
 * @brief destructor
 */
CommandIn::~CommandIn()
{
}



RTC::ReturnCode_t CommandIn::onInitialize()
{
  // Registration: InPort/OutPort/Service
  // <rtc-template block="registration">
  // Set InPort buffers
  addInPort("input", m_inputIn);
  
  // Set OutPort buffer
  addOutPort("command", m_commandOut);
  
  // Set service provider to Ports
  
  // Set service consumers to Ports
  
  // Set CORBA Service Ports
  
  // </rtc-template>

  // <rtc-template block="bind_config">
  // </rtc-template>
  
  return RTC::RTC_OK;
}

/*
RTC::ReturnCode_t CommandIn::onFinalize()
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CommandIn::onStartup(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CommandIn::onShutdown(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CommandIn::onActivated(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CommandIn::onDeactivated(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/


RTC::ReturnCode_t CommandIn::onExecute(RTC::UniqueId ec_id)
{
	if(m_inputIn.isNew())
	{
		m_inputIn.read();
		//m_command.data = m_input.data;
	}
	else
	{
		m_input.data = 0;
	}
	
	//if(strcmp(m_command.data, "exit") == 0) { return RTC::RTC_ERROR; }
	if(m_input.data == 1) { m_command.data = "rdown";}
	else if(m_input.data ==  2) {m_command.data = "ldown";}
	else if(m_input.data == 3) {m_command.data = "rldown";}
	else{ m_command.data = "neutral";}
	m_commandOut.write();

  return RTC::RTC_OK;
}

/*
RTC::ReturnCode_t CommandIn::onAborting(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CommandIn::onError(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CommandIn::onReset(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CommandIn::onStateUpdate(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t CommandIn::onRateChanged(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/



extern "C"
{
 
  void CommandInInit(RTC::Manager* manager)
  {
    coil::Properties profile(commandin_spec);
    manager->registerFactory(profile,
                             RTC::Create<CommandIn>,
                             RTC::Delete<CommandIn>);
  }
  
};


