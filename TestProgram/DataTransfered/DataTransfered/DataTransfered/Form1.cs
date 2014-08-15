using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DataTransfered
{
    public partial class Form1 : Form
    {
        bool isConnected = false;

        public Form1()
        {
            CheckForIllegalCrossThreadCalls = false;
            InitializeComponent();
        }

        public static byte[] StringToByteArray(String hex)
        {
            int NumberChars = hex.Length / 2;
            byte[] bytes = new byte[NumberChars];

            hex = hex.Trim();

            using (var sr = new StringReader(hex))
            {
                for (int i = 0; i < NumberChars; i++)
                {
                    char str1=(char)sr.Read(), str2=(char)sr.Read();

                    while (str1 == 0 | str1 == 32 | str1=='-')
                    {
                        str1 = str2 ;
                        str2 = (char)sr.Read();
                    }

                    bytes[i] =
                      Convert.ToByte(new string(new char[2] { str1, str2 }), 16);
                }
            }
            return bytes;
        }


        public static byte[] StringToByteArrayIncludeSpace(String hex)
        {
            int NumberChars = hex.Length / 3;
            byte[] bytes = new byte[NumberChars];

            hex = hex.Trim();

            using (var sr = new StringReader(hex))
            {
                for (int i = 0; i < NumberChars; i++)
                {
                    char str1 = (char)sr.Read(), str2 = (char)sr.Read();

                    while (str1 == 0 | str1 == 32 | str1 == '-')
                    {
                        str1 = str2;
                        str2 = (char)sr.Read();
                    }

                    bytes[i] =
                      Convert.ToByte(new string(new char[2] { str1, str2 }), 16);
                }
            }
            return bytes;
        }

        public static string ByteArrayToString(byte[] ba)
        {
            StringBuilder hex = new StringBuilder(ba.Length * 2);
            foreach (byte b in ba)
            {
                hex.AppendFormat("{0:x2}", b);
                //hex.Append('-');
            }
            return hex.ToString().TrimEnd(new char[] { '-' });
        }

        private void btnSend_Click(object sender, EventArgs e)
        {
            string str = string.Empty;

            foreach (char c in txtSend.Text)
            {
                if (c != '-')
                    str += c;
            }

            byte[] data = StringToByteArray(str);
            serialPort1.Write(data, 0, data.Length);
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            if (!isConnected)
            {
                serialPort1.PortName = txtPort.Text;
                serialPort1.BaudRate = int.Parse(txtBaund.Text);
                serialPort1.Open();

                btnConnect.Text = "Bağlantıyı kes";
                isConnected = true;

                serialPort1.DataReceived += serialPort1_DataReceived;
            }
            else
            {
                serialPort1.Close();
                btnConnect.Text = "Bağlan";
                isConnected = false;
            }
        }

        void serialPort1_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            byte[] buffer = new byte[4906];
            int readed = serialPort1.Read(buffer, 0, buffer.Length);

            byte[] buffer2 = new byte[buffer[1]];

            Array.Copy(buffer, buffer2, buffer2.Length);

            string result = ByteArrayToString(buffer2);

            lbxReceived.Items.Add(result);
        }

        void analyze(byte[] buffer, ListBox lbox)
        {
            lbox.Items.Clear();

            int value = (int)buffer[0];
            string str = string.Format("{0}\t{1}\t{2}", 0, value, "Pilot Sembol");
            lbox.Items.Add(str);

            value = (int)buffer[1];
            str = string.Format("{0}\t{1}\t{2}", 1, value, "Kod Uzunluğu");
            lbox.Items.Add(str);

            value = ((int)buffer[2]) * 256 + (int)buffer[3];
            str = string.Format("{0}\t{1}\t{2}", 2, value, "Station Id");
            lbox.Items.Add(str);

            value = (int)buffer[4];
            str = string.Format("{0}\t{1}\t{2}", 4, value, "Komut Tipi");
            lbox.Items.Add(str);

            value = (int)buffer[5];
            str = string.Format("{0}\t{1}\t{2}", 5, value, "Yıl");
            lbox.Items.Add(str);

            value = (int)buffer[6];
            str = string.Format("{0}\t{1}\t{2}", 6, value, "Ay");
            lbox.Items.Add(str);

            value = (int)buffer[7];
            str = string.Format("{0}\t{1}\t{2}", 7, value, "Gün");
            lbox.Items.Add(str);


            value = (int)buffer[8];
            str = string.Format("{0}\t{1}\t{2}", 8, value, "Saat");
            lbox.Items.Add(str);

            value = (int)buffer[9];
            str = string.Format("{0}\t{1}\t{2}", 9, value, "Dakika");
            lbox.Items.Add(str);

            value = (int)buffer[10];
            str = string.Format("{0}\t{1}\t{2}", 10, value, "Saniye");
            lbox.Items.Add(str);

            value = (int)buffer[11];
            str = string.Format("{0}\t{1}\t{2}", 11, value, "Head State");
            lbox.Items.Add(str);

            value = (int)buffer[12];
            str = string.Format("{0}\t{1}\t{2}", 12, value & 0x01, "DC/AC");
            lbox.Items.Add(str);

            value = (int)buffer[13];
            str = string.Format("{0}\t{1}\t{2}", 13, value & 0x02, "Interrupts");
            lbox.Items.Add(str);

            value = (int)buffer[13];
            str = string.Format("{0}\t{1}\t{2}", 13, value & 0x04, "Records");
            lbox.Items.Add(str);

            int i = 14;
            while (i < buffer.Length - 4)
            {
                lbox.Items.Add("####################################################");

                value = (int)buffer[i++] * 256 + (int)buffer[i++];//14-20,21
                str = string.Format("\t{0}\t{1}\t{2}", 14, value, "Card Division");
                lbox.Items.Add(str);

                value = (int)buffer[i++];//16-22
                str = string.Format("\t{0}\t{1}\t{2}", 16, value, "Number Of Tag");
                lbox.Items.Add(str);

                value = (int)buffer[i++] + (int)buffer[i++] * 256;//17-18 23,24
                str = string.Format("\t{0}\t{1}\t{2}", 17, value, "Number of Card");
                lbox.Items.Add(str);

                value = (int)buffer[i];//19 25
                str = string.Format("\t{0}\t{1}\t{2}", 19, value & 0x0f, "okuyucu no");
                lbox.Items.Add(str);

                value = (int)buffer[i];//19 25
                str = string.Format("\t{0}\t{1}\t{2}", 19, (value & 0X10) >> 5, "Carry Flag");
                lbox.Items.Add(str);

                value = (int)buffer[i];//19 25
                str = string.Format("\t{0}\t{1}\t{2}", 19, (value & 0x20) >> 6, "Low Voltaj");
                lbox.Items.Add(str);

                value = (int)buffer[i];//19 25
                str = string.Format("\t{0}\t{1}\t{2}", 19, (value & 0x40) >> 7, "Genel Alarm");
                lbox.Items.Add(str);

                value = (int)buffer[i];//19 25
                str = string.Format("\t{0}\t{1}\t{2}", 19, (value & 0x80) >> 8, "Acil Durum Alarmı");
                lbox.Items.Add(str);

                i++;//20

                lbox.Items.Add("#############################################################");
            }

        }

        private void lbxReceived_DoubleClick(object sender, EventArgs e)
        {
            if (lbxReceived.SelectedItem == null) return;

            string str = string.Empty;

            foreach (char c in lbxReceived.SelectedItem.ToString())
            {
                if (c != '-')
                    str += c;
            }

            byte[] selectedArray = StringToByteArray(str);

            analyze(selectedArray, lbxDesc);
        }

        private void btnAnalyze_Click(object sender, EventArgs e)
        {
            string str = string.Empty;

            foreach (char c in txtAnalyze.Text)
            {
                if (c != '-')
                    str += c;
            }

            //byte[] selectedArray = StringToByteArray(str);

            byte[] selectedArray = StringToByteArrayIncludeSpace(str);

            //byte[] crc16Array = new byte[selectedArray.Length - 2];

            //Array.Copy(selectedArray, crc16Array, crc16Array.Length);

            ////int crcUshort = (ushort)ModRTU_CRC(crc16Array, crc16Array.Length);

            //ushort crcUshort = ModRTU_CRC(crc16Array, crc16Array.Length);

            //byte[] crc16Result = new byte[] { (byte)(crcUshort % 256), (byte)(crcUshort / 256) };

            ////byte[] crc16Result = new byte[] { 0, 0 };

            ////GetCRC(crc16Array, ref crc16Result);

            //MessageBox.Show(ByteArrayToString(crc16Result));

            analyze(selectedArray, lbxDesc);
        }

        private void btnSendCustom_Click(object sender, EventArgs e)
        {
            byte[] sendArray = new byte[19];

            sendArray[0] = byte.Parse(txtBootCode.Text); //Boot kod
            sendArray[1] = (byte)sendArray.Length; // uzunluk
            sendArray[2] = (byte)(ushort.Parse(txtSubstationCode.Text) / 256); //substation kode high
            sendArray[3] = (byte)(ushort.Parse(txtSubstationCode.Text) % 256); //substation code low
            sendArray[4] = byte.Parse(txtCommand.Text); //komut tipi
            //sendArray[5] = byte.Parse(dtpDateTime.Value.ToString("yy")); //yıl
            //sendArray[6] = byte.Parse(dtpDateTime.Value.ToString("MM")); //ay
            //sendArray[7] = byte.Parse(dtpDateTime.Value.ToString("dd")); // gün
            //sendArray[8] = byte.Parse(dtpDateTime.Value.ToString("HH")); //saat
            //sendArray[9] = byte.Parse(dtpDateTime.Value.ToString("mm")); // dakika
            //sendArray[10] = byte.Parse(dtpDateTime.Value.ToString("ss"));//saniye
            sendArray[5] = (byte)(DateTime.Now.Year % 2000); //yıl
            sendArray[6] = (byte)DateTime.Now.Month; //ay
            sendArray[7] = (byte)DateTime.Now.Day; // gün
            sendArray[8] = (byte)DateTime.Now.Hour; //saat
            sendArray[9] = (byte)DateTime.Now.Minute;  // dakika
            sendArray[10] = (byte)DateTime.Now.Second;//saniye

            sendArray[11] = byte.Parse(txtClear.Text);  //okuyucu temizlemiş
            sendArray[12] = byte.Parse(txtPeopleNumber.Text); //max okuyacağı kişi sayısı
            sendArray[13] = byte.Parse(txtUncondittionalyAlarm1.Text); //koşulsuz alarm
            sendArray[14] = byte.Parse(txtUncondittionalyAlarm2.Text); //koşulsuz alarm
            sendArray[15] = byte.Parse(txtRandomByteHigh.Text); //rastgele bir sayı
            sendArray[16] = byte.Parse(txtRandomByteLow.Text); //rastgele bir sayı

            ushort crc16 = ModRTU_CRC(sendArray, 17);

            byte[] crc16Result = new byte[] { (byte)(crc16 % 256), (byte)(crc16 / 256) };

            sendArray[17] = crc16Result[0];
            sendArray[18] = crc16Result[1];

            string byteToString = ByteArrayToString(sendArray);

            txtSend.Text = byteToString;
        }

        // Compute the MODBUS RTU CRC
        UInt16 ModRTU_CRC(byte[] buf, int len)
        {
            UInt16 crc = 0xFFFF;

            for (int pos = 0; pos < len; pos++)
            {
                crc ^= (UInt16)buf[pos];          // XOR byte into least sig. byte of crc

                for (int i = 8; i != 0; i--)
                {    // Loop over each bit
                    if ((crc & 0x0001) != 0)
                    {      // If the LSB is set
                        crc >>= 1;                    // Shift right and XOR 0xA001
                        crc ^= 0xA001;
                    }
                    else                            // Else LSB is not set
                        crc >>= 1;                    // Just shift right
                }
            }
            // Note, this number has low and high bytes swapped, so use it accordingly (or swap bytes)
            return crc;
        }
    }
}
