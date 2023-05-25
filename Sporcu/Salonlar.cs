using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Sporcu
{
    public partial class Salonlar : Form
    {
        public Salonlar()
        {
            InitializeComponent();
        }
        SporcuEntities baglan=new SporcuEntities();
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Salonlar_Load(object sender, EventArgs e)
        {
            comboBox1.DataSource=baglan.EgitmenlerBilgis.ToList();
            comboBox1.ValueMember = "EgitmenNo";
        }
        //listele butonu
        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource=baglan.SalonListele().ToList();
        }
        //ekle kaydet butonu
        private void button2_Click(object sender, EventArgs e)
        {
            SalonlarBilgi save = new SalonlarBilgi();
            save.SalonAdi = textBox1.Text;
            save.Salonm2 = textBox2.Text;
            save.EgitmenNo = Convert.ToInt32(comboBox1.Text);
           

            baglan.SalonEkle(save.SalonAdi, save.Salonm2, save.EgitmenNo);
            dataGridView1.DataSource = baglan.SalonListele().ToList();
        }
        //Yenile butonu
        private void button3_Click(object sender, EventArgs e)
        {
            int SalonNo = Convert.ToInt32(textBox1.Tag);
            SalonlarBilgi yenile = new SalonlarBilgi();
            yenile.SalonAdi = textBox1.Text;
            yenile.Salonm2 = textBox2.Text;
            yenile.EgitmenNo = Convert.ToInt32(comboBox1.Text);
            
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int SalonNo = Convert.ToInt32(textBox1.Tag);
            baglan.SalonSil(SalonNo);
            dataGridView1.DataSource = baglan.SalonListele().ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["Salonno"].Value.ToString();
            textBox1.Text = satir.Cells["SalonAdi"].Value.ToString();
            textBox2.Text = satir.Cells["Salonm2"].Value.ToString();
            comboBox1.Text = satir.Cells["EgitmenNo"].Value.ToString();
            
        }
    }
}
