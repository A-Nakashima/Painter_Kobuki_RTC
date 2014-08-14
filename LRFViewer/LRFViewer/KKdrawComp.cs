using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using OpenRTM.Core;

namespace KKdraw
{
    /// <summary>
    /// GUIから利用するコンポーネント
    /// 周期処理は必要ないのでEmptyExecutionContextを指定
    /// </summary>
    [Component(Category = "Examples", Name = "KKdrawComponent", ExecutionContext = "EmptyExecutionContext")]
    class LRFViewerComponent : DataFlowComponent
    {
        [InPort(PortName = "inRightHand")]
        private InPort<TimedPoint2D> inport_righthand = new InPort<TimedPoint2D>();

        [InPort(PortName = "inLeftHand")]
        private InPort<TimedPoint2D> inport_lefthand = new InPort<TimedPoint2D>();


        [InPort(PortName = "inColor")]
        private InPort<TimedShort> inport_color = new InPort<TimedShort>();

/*        [OutPort(PortName = "outWaypoint")]
        private OutPort<TimedPoint2D> outport_waypoint = new OutPort<TimedPoint2D>();
        */

        protected override ReturnCode_t OnInitialize()
        {
            // inportにデータが書き込まれたらイベントを発生させる
            inport_righthand.OnWrite += value =>
            {
                if (Received_righthanddata != null)
                {
                    Received_righthanddata(value);
                }
            };

            inport_lefthand.OnWrite += value =>
            {
                if (Received_lefthanddata != null)
                {
                    Received_lefthanddata(value);
                }
            };

            inport_color.OnWrite += value =>
            {
                if (Received_colordata != null)
                {
                    Received_colordata(value);
                }
            };

            return ReturnCode_t.RTC_OK;
        }

        /// <summary>
        /// outportからデータを出力する
        /// </summary>
/*        public void SendData(TimedPoint2D data)
        {
            outport_waypoint.Write(data);
        }
*/

        /// <summary>
        /// データを受信したときに発生するイベント
        /// </summary>
        public event Action<TimedPoint2D> Received_righthanddata;
        public event Action<TimedPoint2D> Received_lefthanddata;
        public event Action<TimedShort> Received_colordata;
    }
}
