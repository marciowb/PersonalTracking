namespace DataTransfered
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.serialPort1 = new System.IO.Ports.SerialPort(this.components);
            this.txtPort = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtBaund = new System.Windows.Forms.TextBox();
            this.txtSend = new System.Windows.Forms.TextBox();
            this.lbxReceived = new System.Windows.Forms.ListBox();
            this.btnSend = new System.Windows.Forms.Button();
            this.btnConnect = new System.Windows.Forms.Button();
            this.lbxDesc = new System.Windows.Forms.ListBox();
            this.btnAnalyze = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.txtBootCode = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtSubstationCode = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtCommand = new System.Windows.Forms.TextBox();
            this.dtpDateTime = new System.Windows.Forms.DateTimePicker();
            this.label6 = new System.Windows.Forms.Label();
            this.txtClear = new DevExpress.XtraEditors.TextEdit();
            this.label7 = new System.Windows.Forms.Label();
            this.txtPeopleNumber = new DevExpress.XtraEditors.TextEdit();
            this.label8 = new System.Windows.Forms.Label();
            this.txtUncondittionalyAlarm1 = new DevExpress.XtraEditors.TextEdit();
            this.label9 = new System.Windows.Forms.Label();
            this.txtUncondittionalyAlarm2 = new DevExpress.XtraEditors.TextEdit();
            this.label10 = new System.Windows.Forms.Label();
            this.txtRandomByteHigh = new DevExpress.XtraEditors.TextEdit();
            this.label11 = new System.Windows.Forms.Label();
            this.txtRandomByteLow = new DevExpress.XtraEditors.TextEdit();
            this.label12 = new System.Windows.Forms.Label();
            this.btnSendCustom = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtAnalyze = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.txtClear.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtPeopleNumber.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtUncondittionalyAlarm1.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtUncondittionalyAlarm2.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtRandomByteHigh.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtRandomByteLow.Properties)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // serialPort1
            // 
            this.serialPort1.BaudRate = 2400;
            this.serialPort1.PortName = "COM3";
            this.serialPort1.DataReceived += new System.IO.Ports.SerialDataReceivedEventHandler(this.serialPort1_DataReceived);
            // 
            // txtPort
            // 
            this.txtPort.Location = new System.Drawing.Point(79, 12);
            this.txtPort.Name = "txtPort";
            this.txtPort.Size = new System.Drawing.Size(100, 20);
            this.txtPort.TabIndex = 0;
            this.txtPort.Text = "COM3";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(26, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Port";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 43);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(61, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "BaundRate";
            // 
            // txtBaund
            // 
            this.txtBaund.Location = new System.Drawing.Point(79, 40);
            this.txtBaund.Name = "txtBaund";
            this.txtBaund.Size = new System.Drawing.Size(100, 20);
            this.txtBaund.TabIndex = 3;
            this.txtBaund.Text = "2400";
            // 
            // txtSend
            // 
            this.txtSend.Location = new System.Drawing.Point(15, 80);
            this.txtSend.Name = "txtSend";
            this.txtSend.Size = new System.Drawing.Size(755, 20);
            this.txtSend.TabIndex = 4;
            // 
            // lbxReceived
            // 
            this.lbxReceived.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.lbxReceived.FormattingEnabled = true;
            this.lbxReceived.Location = new System.Drawing.Point(15, 269);
            this.lbxReceived.Name = "lbxReceived";
            this.lbxReceived.Size = new System.Drawing.Size(830, 108);
            this.lbxReceived.TabIndex = 5;
            this.lbxReceived.DoubleClick += new System.EventHandler(this.lbxReceived_DoubleClick);
            // 
            // btnSend
            // 
            this.btnSend.Location = new System.Drawing.Point(786, 78);
            this.btnSend.Name = "btnSend";
            this.btnSend.Size = new System.Drawing.Size(63, 23);
            this.btnSend.TabIndex = 6;
            this.btnSend.Text = "Gönder";
            this.btnSend.UseVisualStyleBackColor = true;
            this.btnSend.Click += new System.EventHandler(this.btnSend_Click);
            // 
            // btnConnect
            // 
            this.btnConnect.Location = new System.Drawing.Point(263, 12);
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.Size = new System.Drawing.Size(75, 23);
            this.btnConnect.TabIndex = 7;
            this.btnConnect.Text = "Bağlan";
            this.btnConnect.UseVisualStyleBackColor = true;
            this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
            // 
            // lbxDesc
            // 
            this.lbxDesc.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lbxDesc.FormattingEnabled = true;
            this.lbxDesc.Location = new System.Drawing.Point(12, 402);
            this.lbxDesc.Name = "lbxDesc";
            this.lbxDesc.Size = new System.Drawing.Size(834, 147);
            this.lbxDesc.TabIndex = 8;
            // 
            // btnAnalyze
            // 
            this.btnAnalyze.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.btnAnalyze.Location = new System.Drawing.Point(0, 575);
            this.btnAnalyze.Name = "btnAnalyze";
            this.btnAnalyze.Size = new System.Drawing.Size(857, 23);
            this.btnAnalyze.TabIndex = 10;
            this.btnAnalyze.Text = "Çözümle";
            this.btnAnalyze.UseVisualStyleBackColor = true;
            this.btnAnalyze.Click += new System.EventHandler(this.btnAnalyze_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(15, 30);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(54, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Boot Kod:";
            // 
            // txtBootCode
            // 
            this.txtBootCode.Location = new System.Drawing.Point(103, 27);
            this.txtBootCode.Name = "txtBootCode";
            this.txtBootCode.Size = new System.Drawing.Size(123, 20);
            this.txtBootCode.TabIndex = 12;
            this.txtBootCode.Text = "126";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(15, 56);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(82, 13);
            this.label4.TabIndex = 11;
            this.label4.Text = "Substation Kod:";
            // 
            // txtSubstationCode
            // 
            this.txtSubstationCode.Location = new System.Drawing.Point(103, 56);
            this.txtSubstationCode.Name = "txtSubstationCode";
            this.txtSubstationCode.Size = new System.Drawing.Size(123, 20);
            this.txtSubstationCode.TabIndex = 12;
            this.txtSubstationCode.Text = "255";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(15, 82);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(60, 13);
            this.label5.TabIndex = 11;
            this.label5.Text = "Komut Tipi:";
            // 
            // txtCommand
            // 
            this.txtCommand.Location = new System.Drawing.Point(103, 79);
            this.txtCommand.Name = "txtCommand";
            this.txtCommand.Size = new System.Drawing.Size(123, 20);
            this.txtCommand.TabIndex = 12;
            this.txtCommand.Text = "70";
            // 
            // dtpDateTime
            // 
            this.dtpDateTime.CustomFormat = "dd.MM.yyyy HH:mm:ss";
            this.dtpDateTime.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpDateTime.Location = new System.Drawing.Point(103, 105);
            this.dtpDateTime.Name = "dtpDateTime";
            this.dtpDateTime.Size = new System.Drawing.Size(123, 20);
            this.dtpDateTime.TabIndex = 13;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(15, 111);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(34, 13);
            this.label6.TabIndex = 11;
            this.label6.Text = "Tarih:";
            // 
            // txtClear
            // 
            this.txtClear.EditValue = "0";
            this.txtClear.Location = new System.Drawing.Point(398, 30);
            this.txtClear.Name = "txtClear";
            this.txtClear.Size = new System.Drawing.Size(100, 20);
            this.txtClear.TabIndex = 14;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(236, 33);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(88, 13);
            this.label7.TabIndex = 15;
            this.label7.Text = "Cihazları Temizle:";
            // 
            // txtPeopleNumber
            // 
            this.txtPeopleNumber.EditValue = "8";
            this.txtPeopleNumber.Location = new System.Drawing.Point(398, 56);
            this.txtPeopleNumber.Name = "txtPeopleNumber";
            this.txtPeopleNumber.Size = new System.Drawing.Size(100, 20);
            this.txtPeopleNumber.TabIndex = 14;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(236, 59);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(138, 13);
            this.label8.TabIndex = 15;
            this.label8.Text = "Azami Okunan İnsan Sayısı:";
            // 
            // txtUncondittionalyAlarm1
            // 
            this.txtUncondittionalyAlarm1.EditValue = "0";
            this.txtUncondittionalyAlarm1.Location = new System.Drawing.Point(398, 79);
            this.txtUncondittionalyAlarm1.Name = "txtUncondittionalyAlarm1";
            this.txtUncondittionalyAlarm1.Size = new System.Drawing.Size(100, 20);
            this.txtUncondittionalyAlarm1.TabIndex = 14;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(236, 82);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(130, 13);
            this.label9.TabIndex = 15;
            this.label9.Text = "Koşulsuz Alarm Durumu 1:";
            // 
            // txtUncondittionalyAlarm2
            // 
            this.txtUncondittionalyAlarm2.EditValue = "0";
            this.txtUncondittionalyAlarm2.Location = new System.Drawing.Point(397, 105);
            this.txtUncondittionalyAlarm2.Name = "txtUncondittionalyAlarm2";
            this.txtUncondittionalyAlarm2.Size = new System.Drawing.Size(100, 20);
            this.txtUncondittionalyAlarm2.TabIndex = 14;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(235, 108);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(133, 13);
            this.label10.TabIndex = 15;
            this.label10.Text = "Koşulsuz Alarm Durumu 2 :";
            // 
            // txtRandomByteHigh
            // 
            this.txtRandomByteHigh.EditValue = "0";
            this.txtRandomByteHigh.Location = new System.Drawing.Point(673, 29);
            this.txtRandomByteHigh.Name = "txtRandomByteHigh";
            this.txtRandomByteHigh.Size = new System.Drawing.Size(100, 20);
            this.txtRandomByteHigh.TabIndex = 14;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(511, 32);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(128, 13);
            this.label11.TabIndex = 15;
            this.label11.Text = "Rastgele Kod - High(byte)";
            // 
            // txtRandomByteLow
            // 
            this.txtRandomByteLow.EditValue = "0";
            this.txtRandomByteLow.Location = new System.Drawing.Point(673, 55);
            this.txtRandomByteLow.Name = "txtRandomByteLow";
            this.txtRandomByteLow.Size = new System.Drawing.Size(100, 20);
            this.txtRandomByteLow.TabIndex = 14;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(511, 58);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(126, 13);
            this.label12.TabIndex = 15;
            this.label12.Text = "Rastgele Kod - Low(byte)";
            // 
            // btnSendCustom
            // 
            this.btnSendCustom.Location = new System.Drawing.Point(736, 106);
            this.btnSendCustom.Name = "btnSendCustom";
            this.btnSendCustom.Size = new System.Drawing.Size(75, 23);
            this.btnSendCustom.TabIndex = 16;
            this.btnSendCustom.Text = "Oluştur";
            this.btnSendCustom.UseVisualStyleBackColor = true;
            this.btnSendCustom.Click += new System.EventHandler(this.btnSendCustom_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtPeopleNumber);
            this.groupBox1.Controls.Add(this.btnSendCustom);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label12);
            this.groupBox1.Controls.Add(this.txtBootCode);
            this.groupBox1.Controls.Add(this.label11);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.txtRandomByteLow);
            this.groupBox1.Controls.Add(this.txtSubstationCode);
            this.groupBox1.Controls.Add(this.label10);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.txtRandomByteHigh);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Controls.Add(this.txtCommand);
            this.groupBox1.Controls.Add(this.txtUncondittionalyAlarm2);
            this.groupBox1.Controls.Add(this.dtpDateTime);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.txtClear);
            this.groupBox1.Controls.Add(this.txtUncondittionalyAlarm1);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Location = new System.Drawing.Point(11, 107);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(834, 140);
            this.groupBox1.TabIndex = 17;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "groupBox1";
            // 
            // txtAnalyze
            // 
            this.txtAnalyze.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.txtAnalyze.Location = new System.Drawing.Point(0, 555);
            this.txtAnalyze.Name = "txtAnalyze";
            this.txtAnalyze.Size = new System.Drawing.Size(857, 20);
            this.txtAnalyze.TabIndex = 18;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(15, 253);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(58, 13);
            this.label13.TabIndex = 19;
            this.label13.Text = "Gönderilen";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(13, 386);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(36, 13);
            this.label14.TabIndex = 19;
            this.label14.Text = "Alınan";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(857, 598);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.txtAnalyze);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnAnalyze);
            this.Controls.Add(this.lbxDesc);
            this.Controls.Add(this.btnConnect);
            this.Controls.Add(this.btnSend);
            this.Controls.Add(this.lbxReceived);
            this.Controls.Add(this.txtSend);
            this.Controls.Add(this.txtBaund);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtPort);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.txtClear.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtPeopleNumber.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtUncondittionalyAlarm1.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtUncondittionalyAlarm2.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtRandomByteHigh.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtRandomByteLow.Properties)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.IO.Ports.SerialPort serialPort1;
        private System.Windows.Forms.TextBox txtPort;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtBaund;
        private System.Windows.Forms.TextBox txtSend;
        private System.Windows.Forms.ListBox lbxReceived;
        private System.Windows.Forms.Button btnSend;
        private System.Windows.Forms.Button btnConnect;
        private System.Windows.Forms.ListBox lbxDesc;
        private System.Windows.Forms.Button btnAnalyze;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtBootCode;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtSubstationCode;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtCommand;
        private System.Windows.Forms.DateTimePicker dtpDateTime;
        private System.Windows.Forms.Label label6;
        private DevExpress.XtraEditors.TextEdit txtClear;
        private System.Windows.Forms.Label label7;
        private DevExpress.XtraEditors.TextEdit txtPeopleNumber;
        private System.Windows.Forms.Label label8;
        private DevExpress.XtraEditors.TextEdit txtUncondittionalyAlarm1;
        private System.Windows.Forms.Label label9;
        private DevExpress.XtraEditors.TextEdit txtUncondittionalyAlarm2;
        private System.Windows.Forms.Label label10;
        private DevExpress.XtraEditors.TextEdit txtRandomByteHigh;
        private System.Windows.Forms.Label label11;
        private DevExpress.XtraEditors.TextEdit txtRandomByteLow;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Button btnSendCustom;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtAnalyze;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label14;
    }
}

