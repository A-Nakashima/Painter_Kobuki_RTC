using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using OpenRTM.Core;
using OpenRTM.Extension;
using OpenRTM.IIOP;

using System.Drawing.Imaging;
using System.IO;

namespace KKdraw
{
    public partial class Form1 : Form
    {
        private Manager manager;
        private LRFViewerComponent component;

        List<coloredPoint> list_rightpoints;

        short? tmpcolor = null;
        Point2D tmprightpoint = null;
        Point2D tmpleftpoint = null;

        Graphics g;
        Pen blackpen, redpen, bluepen, greenpen, pen;
        float gratio, gwidth, gheight, xoffset, yoffset;

        bool isGraphicsUsed = false;

        public Form1()
        {
            InitializeComponent();

            manager = new Manager();
            manager.AddTypes(typeof(CorbaProtocolManager));
            manager.Activate();
            component = manager.CreateComponent<LRFViewerComponent>();

            if (component == null)
            {
                throw new ApplicationException("コンポーネントの作成に失敗しました。");
            }

            component.Received_righthanddata += onReceived_righthanddata;
            component.Received_lefthanddata += onReceived_lefthanddata;
            component.Received_colordata += onReceived_colordata;

            list_rightpoints = new List<coloredPoint>();

            g = pictureBox1.CreateGraphics();

            blackpen = new Pen(Color.Blue, 3);
            redpen = new Pen(Color.Red, 2);
            bluepen = new Pen(Color.Black, 2);
            greenpen = new Pen(Color.Green, 2);

            gwidth = pictureBox1.Width;
            gheight = pictureBox1.Height;
            gratio = 300.0F;
            xoffset = pictureBox1.Width / 2;
            yoffset = pictureBox1.Height / 2;

            timer1.Start();
        }

        private void onReceived_righthanddata(TimedPoint2D trjdata)
        {
            if (InvokeRequired)
            {
                Invoke(new Action<TimedPoint2D>(onReceived_righthanddata), new object[] { trjdata });

                try
                {
                    tmprightpoint = new Point2D();
                    tmprightpoint.X = -trjdata.Data.Y;
                    tmprightpoint.Y = -trjdata.Data.X;
                    addpoint();
                }
                catch { }
                
                if (isGraphicsUsed == false)
                    drawpoints();
                return;
            }
        }

        private void onReceived_lefthanddata(TimedPoint2D trjdata)
        {
            if (InvokeRequired)
            {
                Invoke(new Action<TimedPoint2D>(onReceived_lefthanddata), new object[] { trjdata });

                if (tmpleftpoint == null)
                    tmpleftpoint = new Point2D();

                tmpleftpoint.X = - trjdata.Data.Y;
                tmpleftpoint.Y = - trjdata.Data.X;

 //               drawpoints();
                return;
            }
        }

        private void onReceived_colordata(TimedShort colordata)
        {
            if (InvokeRequired)
            {
                Invoke(new Action<TimedShort>(onReceived_colordata), new object[] { colordata });
                tmpcolor = (short?)(colordata.Data);

                addpoint();
                return;
            }
        }

        private void addpoint()
        {
            if (tmpcolor != null && tmprightpoint != null)
            {
                coloredPoint tmpcp = new coloredPoint();
                if (tmpcolor == null)
                    tmpcp.color = (short)0;
                else
                    tmpcp.color = (short)tmpcolor;
                try
                {
                    tmpcp.point.X = tmprightpoint.X;
                    tmpcp.point.Y = tmprightpoint.Y;

                    list_rightpoints.Add(tmpcp);

                    tmprightpoint = null;
                    tmpcolor = null;
                }
                catch
                {
                    tmprightpoint = null;
                    tmpcolor = null;
                }
            }

        }

        private void drawpoints()
        {
            isGraphicsUsed = true;

            try
            {
                g.Clear(Color.White);
                g.DrawRectangle(bluepen, new Rectangle(0, 0, pictureBox1.Width / 3, pictureBox1.Height / 3 - 2));
                g.DrawRectangle(redpen, new Rectangle(0, pictureBox1.Height / 3, pictureBox1.Width / 3, pictureBox1.Height / 3 - 2));
                g.DrawRectangle(greenpen, new Rectangle(0, pictureBox1.Height / 3 * 2, pictureBox1.Width / 3, pictureBox1.Height / 3));

                if (list_rightpoints.Count > 0)
                {
                    for (int i = 0; i < list_rightpoints.Count; i++)
                    {
                        if (list_rightpoints[i].color == 1)
                            pen = bluepen;
                        else if (list_rightpoints[i].color == 2)
                            pen = redpen;
                        else if (list_rightpoints[i].color == 3)
                            pen = greenpen;
                        else
                            pen = blackpen;

                        g.DrawEllipse(pen,
                            (float)(list_rightpoints[i].point.X * gratio + xoffset), (float)(list_rightpoints[i].point.Y * gratio + yoffset),
                            4.0f, 4.0f);

                        if (i >0)
                            if (list_rightpoints[i - 1].color == list_rightpoints[i].color)
                            {
                                g.DrawLine(pen, (float)(list_rightpoints[i - 1].point.X*gratio+xoffset),
                                    (float)(list_rightpoints[i - 1].point.Y*gratio+yoffset),
                                    (float)(list_rightpoints[i].point.X*gratio+xoffset),
                                    (float)(list_rightpoints[i].point.Y*gratio+yoffset));
                            }
                    }
                    if (list_rightpoints[list_rightpoints.Count - 1].color >= 1 && list_rightpoints[list_rightpoints.Count - 1].color <= 3)
                    {
                        Pen tmppen = new Pen(pen.Color, 5);
                        g.DrawRectangle(tmppen, new Rectangle(0, pictureBox1.Height / 3 * (list_rightpoints[list_rightpoints.Count - 1].color - 1),
                            pictureBox1.Width / 3, pictureBox1.Height / 3 - 2));
                    }

                    if (list_rightpoints[list_rightpoints.Count - 1].color == 0 || list_rightpoints[list_rightpoints.Count - 1].color >3)
                        list_rightpoints.RemoveAt(list_rightpoints.Count - 1);
                }

                if (tmpleftpoint != null)
                {
                    g.DrawEllipse(blackpen,
                        (float)(tmpleftpoint.X * gratio + xoffset), (float)(tmpleftpoint.Y * gratio + yoffset),
                        4.0f, 4.0f);
                }
            }
            catch (Exception e)
            {
                ;
            }

            isGraphicsUsed = false;
        }

        public class coloredPoint
        {
            public short color;
            public Point2D point;

            public coloredPoint(){
                point = new Point2D(); 
            }
         }

        private void button_clear_Click(object sender, EventArgs e)
        {
            list_rightpoints.Clear();
            drawpoints();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            drawpoints();
        }
    }
}
