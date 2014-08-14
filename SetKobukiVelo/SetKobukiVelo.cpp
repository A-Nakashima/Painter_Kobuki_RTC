// -*- C++ -*-
/*!
 * @file  SetKobukiVelo.cpp
 * @brief Kobuki操作用コンポーネント
 * @date $Date$
 *
 * $Id$
 */

#include "SetKobukiVelo.h"
#define _USE_MATH_DEFINES
#include<math.h>

// Module specification
// <rtc-template block="module_spec">
static const char* setkobukivelo_spec[] =
  {
    "implementation_id", "SetKobukiVelo",
    "type_name",         "SetKobukiVelo",
    "description",       "Kobuki操作用コンポーネント",
    "version",           "1.0.0",
    "vendor",            "A.Nakas",
    "category",          "Category",
    "activity_type",     "PERIODIC",
    "kind",              "DataFlowComponent",
    "max_instance",      "1",
    "language",          "C++",
    "lang_type",         "compile",
    // Configuration variables
    "conf.default.cfg_goal_X", "0",
    "conf.default.cfg_goal_Y", "0",
    "conf.default.cfg_goal_sita", "0",
    "conf.default.cfg_velo_X", "0",
    "conf.default.cfg_velo_Y", "0",
    "conf.default.cfg_velo_a", "0",
    "conf.default.set_max_speed", "0.1",
    "conf.default.bumper_react", "1",
    "conf.default.set_max_revol", "1.07",
    // Widget
    "conf.__widget__.cfg_goal_X", "text",
    "conf.__widget__.cfg_goal_Y", "text",
    "conf.__widget__.cfg_goal_sita", "text",
    "conf.__widget__.cfg_velo_X", "text",
    "conf.__widget__.cfg_velo_Y", "text",
    "conf.__widget__.cfg_velo_a", "text",
    "conf.__widget__.set_max_speed", "text",
    "conf.__widget__.bumper_react", "text",
    "conf.__widget__.set_max_revol", "text",
    // Constraints
    ""
  };
// </rtc-template>

/*!
 * @brief constructor
 * @param manager Maneger Object
 */
SetKobukiVelo::SetKobukiVelo(RTC::Manager* manager)
    // <rtc-template block="initializer">
  : RTC::DataFlowComponentBase(manager),
    m_ref_goal_posIn("ref_goal_pos", m_ref_goal_pos),
    m_ref_now_posIn("ref_now_pos", m_ref_now_pos),
    m_ref_bumperIn("ref_bumper", m_ref_bumper),
    m_out_velocityOut("out_velocity", m_out_velocity)

    // </rtc-template>
{
}

/*!
 * @brief destructor
 */
SetKobukiVelo::~SetKobukiVelo()
{
}



RTC::ReturnCode_t SetKobukiVelo::onInitialize()
{
  // Registration: InPort/OutPort/Service
  // <rtc-template block="registration">
  // Set InPort buffers
  addInPort("ref_goal_pos", m_ref_goal_posIn);
  addInPort("ref_now_pos", m_ref_now_posIn);
  addInPort("ref_bumper", m_ref_bumperIn);
  
  // Set OutPort buffer
  addOutPort("out_velocity", m_out_velocityOut);
  
  // Set service provider to Ports
  
  // Set service consumers to Ports
  
  // Set CORBA Service Ports
  
  // </rtc-template>

  // <rtc-template block="bind_config">
  // Bind variables and configuration variable
  bindParameter("cfg_goal_X", m_cfg_goal_X, "0");
  bindParameter("cfg_goal_Y", m_cfg_goal_Y, "0");
  bindParameter("cfg_goal_sita", m_cfg_goal_sita, "0");
  bindParameter("cfg_velo_X", m_cfg_velo_X, "0");
  bindParameter("cfg_velo_Y", m_cfg_velo_Y, "0");
  bindParameter("cfg_velo_a", m_cfg_velo_a, "0");
  bindParameter("set_max_speed", m_set_max_speed, "0.1");
  bindParameter("bumper_react", m_bumper_react, "1");
  bindParameter("set_max_revol", m_set_max_revol, "1.07");

  std::cout<<"●RTMサマーキャンプ : SetKobukiVeloコンポーネント";
  std::cout<<"\n　本コンポーネントは以下のポートから得られたデータを基に\n　Kobukiに対し速度指令値をだす．";
  std::cout<<"\n\n●PortIn";
  std::cout<<"\n　ref_goal_pos : TimedPose2D型．";
  std::cout<<"\n            　   kobukiが行きたい目標地点を入力するポート";
  std::cout<<"\n　ref_LRF : TimedDobuleSeq型．";
  std::cout<<"\n        　  LRFのデータを入力するポート．一番近い障害物をよけようとする．";
  std::cout<<"\n          　後述のコンフィギュレーションでシミュ用か実機用のモード変更ができる";
  std::cout<<"\n　ref_now_pos : TimedPose2D型．Kobukiの現在位置を入力するポート";
  std::cout<<"\n\n●PortOut";
  std::cout<<"\n　out_velocity : TimedVelocity2D型．Kobukiに対し直進と回転の速度指令を与える．";
  std::cout<<"\n      　         直進速度は最大0.1m/sで回転は最大pi/2";
  std::cout<<"\n\n●Configuration parameter";
  std::cout<<"\n　目標座標および速度指令";
  std::cout<<std::endl;
  std::cout<<"\nイニシャライズ完了";
  // </rtc-template>
  return RTC::RTC_OK;
}

/*
RTC::ReturnCode_t SetKobukiVelo::onFinalize()
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t SetKobukiVelo::onStartup(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t SetKobukiVelo::onShutdown(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/


RTC::ReturnCode_t SetKobukiVelo::onActivated(RTC::UniqueId ec_id)
{
	// 目標位置と現在位置を0で初期化
	m_ref_goal_pos.data.position.x = 0;
	m_ref_goal_pos.data.position.y = 0;
	m_ref_goal_pos.data.heading = 0;
	m_ref_now_pos.data.position.x = 0;
	m_ref_now_pos.data.position.y = 0;
	m_ref_now_pos.data.heading = 0;
	m_out_velocity.data.vx = 0;
	m_out_velocity.data.vy = 0;
	m_out_velocity.data.va = 0;

	std::cout<<"\nアクティベート完了";
  return RTC::RTC_OK;
}


RTC::ReturnCode_t SetKobukiVelo::onDeactivated(RTC::UniqueId ec_id)
{
	std::cout<<"\n\nディ・アクティベートされました．";
	std::cout<<"\n";
	m_out_velocity.data.vx = 0;
	m_out_velocity.data.vy = 0;
	m_out_velocity.data.va = 0;
	m_out_velocityOut.write();
  return RTC::RTC_OK;
}


RTC::ReturnCode_t SetKobukiVelo::onExecute(RTC::UniqueId ec_id)
{
	// 入力についてそれぞれ最新のデータがあれば読み込む
	if(m_ref_goal_posIn.isNew()) m_ref_goal_posIn.read();
	if(m_ref_now_posIn.isNew()) m_ref_now_posIn.read();
	if(m_ref_bumperIn.isNew())
	{
		m_ref_bumperIn.read();
		for(int i = 0; i<m_ref_bumper.data.length(); i++)
		{
			if(m_ref_bumper.data[i])
			{
				m_out_velocity.data.vx = (double)0;
				m_out_velocity.data.vy = (double)0;
				m_out_velocity.data.va = (double)0;
				m_out_velocityOut.write();
				return RTC::RTC_OK;
			}
		}

	}

	// 宣言
	double direction_x, direction_y; // 目的地の方向を算出するためのもの
	double tmp_vec; // 単位ベクトルかするためのもの
	double tmp_rot;

	// 目的地への相対座標を計算
	direction_x = m_ref_goal_pos.data.position.x - m_ref_now_pos.data.position.x + m_cfg_goal_X; // 目的地－現在地＋コンフィギュレーションのX
	direction_y = m_ref_goal_pos.data.position.y - m_ref_now_pos.data.position.y + m_cfg_goal_Y; // 目的地－現在地＋コンフィギュレーションのY

	// 単位ベクトル化するための計算
	tmp_vec = sqrt(direction_x*direction_x + direction_y * direction_y);
	tmp_rot = atan2(direction_y, direction_x) - m_ref_now_pos.data.heading;
	std::cout<<"\rtmp_rot = "<<tmp_rot;

	float vec_shikiichi,rot_shikiichi;
	if(tmp_rot<M_PI*5/180 && tmp_rot>-M_PI*5/180)rot_shikiichi = 0;
	else if(tmp_rot<M_PI/4 && tmp_rot>-M_PI/4) rot_shikiichi = tmp_rot/(M_PI/4);
	else rot_shikiichi = 1;
	
	// 目標地点が残り半径30cm以内ならファジイな制御，10cm以内なら停止
	
	if(tmp_vec<0.1) {vec_shikiichi = 0; rot_shikiichi = 0;}
	else if(tmp_vec<0.3) vec_shikiichi = tmp_vec/0.3;
	else vec_shikiichi = 1;

	// 向きの変化に合わせて直進速度の変更
	m_out_velocity.data.vx = m_set_max_speed *vec_shikiichi*(1-fabs(rot_shikiichi)) + m_cfg_velo_X;
	m_out_velocity.data.vy = m_cfg_velo_Y;
	m_out_velocity.data.va = m_set_max_revol * rot_shikiichi;

	// 最大速度や回転が暴走しないように配慮
	if(m_out_velocity.data.vx >  m_set_max_speed) m_out_velocity.data.vx =  m_set_max_speed;
	if(m_out_velocity.data.vx < -m_set_max_speed) m_out_velocity.data.vx = -m_set_max_speed;
	if(m_out_velocity.data.vy >  m_set_max_speed) m_out_velocity.data.vy =  m_set_max_speed;
	if(m_out_velocity.data.vy < -m_set_max_speed) m_out_velocity.data.vy = -m_set_max_speed;
	if(m_out_velocity.data.va >  m_set_max_revol) m_out_velocity.data.va =  m_set_max_revol;
	if(m_out_velocity.data.va < -m_set_max_revol) m_out_velocity.data.va = -m_set_max_revol;

	// Outポート出力
	m_out_velocityOut.write();

	return RTC::RTC_OK;
}

/*
RTC::ReturnCode_t SetKobukiVelo::onAborting(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t SetKobukiVelo::onError(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t SetKobukiVelo::onReset(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t SetKobukiVelo::onStateUpdate(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/

/*
RTC::ReturnCode_t SetKobukiVelo::onRateChanged(RTC::UniqueId ec_id)
{
  return RTC::RTC_OK;
}
*/



extern "C"
{
 
  void SetKobukiVeloInit(RTC::Manager* manager)
  {
    coil::Properties profile(setkobukivelo_spec);
    manager->registerFactory(profile,
                             RTC::Create<SetKobukiVelo>,
                             RTC::Delete<SetKobukiVelo>);
  }
  
};


