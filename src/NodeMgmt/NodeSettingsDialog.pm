# Form implementation generated from reading ui file 'NodeSettingsDialog.ui'
#
# Created: Thu Dec 23 15:36:10 2004
#      by: The PerlQt User Interface Compiler (puic)
#
# WARNING! All changes made in this file will be lost!


use strict;
use utf8;


package NodeSettingsDialog;
use Qt;
use Qt::isa qw(Qt::Dialog);
use Qt::slots
    init => [],
    setundopoint => [],
    restoreundo => [];
use Qt::attributes qw(
    textLabel2
    textLabel2_font
    nameprefix
    nameprefix_font
    startingnumlabel
    startingnumlabel_font
    startingnum
    startingnum_font
    textLabel3
    textLabel3_font
    startingip
    startingip_font
    textLabel6
    textLabel6_font
    padding
    padding_font
    textLabel4
    textLabel4_font
    netmask
    netmask_font
    textLabel5
    textLabel5_font
    gateway
    gateway_font
    textLabel7
    textLabel7_font
    interface
    interface_font
    imagelabel
    imagelabel_font
    image
    image_font
    nodesettingsOK
    nodesettingsOK_font
    nodesettingsCancel
    nodesettingsCancel_font
);

use lib "$ENV{OSCAR_HOME}/lib";;
use OSCAR::Database;;

sub uic_load_pixmap_NodeSettingsDialog
{
    my $pix = Qt::Pixmap();
    my $m = Qt::MimeSourceFactory::defaultFactory()->data(shift);

    if($m)
    {
        Qt::ImageDrag::decode($m, $pix);
    }

    return $pix;
}


sub NEW
{
    shift->SUPER::NEW(@_[0..3]);

    if( name() eq "unnamed" )
    {
        setName("NodeSettingsDialog");
    }
    resize(188,247);
    setCaption(trUtf8("Node Settings"));

    my $NodeSettingsDialogLayout = Qt::GridLayout(this, 1, 1, 0, 0, '$NodeSettingsDialogLayout');

    my $layout89 = Qt::VBoxLayout(undef, 5, 0, '$layout89');

    my $layout1 = Qt::HBoxLayout(undef, 0, 0, '$layout1');

    textLabel2 = Qt::Label(this, "textLabel2");
    textLabel2_font = Qt::Font(textLabel2->font);
    textLabel2_font->setFamily("Helvetica");
    textLabel2->setFont(textLabel2_font);
    textLabel2->setText(trUtf8("Naming Prefix"));
    $layout1->addWidget(textLabel2);

    nameprefix = Qt::LineEdit(this, "nameprefix");
    nameprefix_font = Qt::Font(nameprefix->font);
    nameprefix_font->setFamily("Helvetica");
    nameprefix->setFont(nameprefix_font);
    nameprefix->setText(trUtf8("node"));
    nameprefix->setMaxLength(int(255));
    nameprefix->setCursorPosition(int(4));
    $layout1->addWidget(nameprefix);
    $layout89->addLayout($layout1);

    my $layout31 = Qt::HBoxLayout(undef, 0, 0, '$layout31');

    startingnumlabel = Qt::Label(this, "startingnumlabel");
    startingnumlabel_font = Qt::Font(startingnumlabel->font);
    startingnumlabel_font->setFamily("Helvetica");
    startingnumlabel->setFont(startingnumlabel_font);
    startingnumlabel->setText(trUtf8("Starting Number"));
    $layout31->addWidget(startingnumlabel);

    startingnum = Qt::LineEdit(this, "startingnum");
    startingnum_font = Qt::Font(startingnum->font);
    startingnum_font->setFamily("Helvetica");
    startingnum->setFont(startingnum_font);
    startingnum->setText(trUtf8("1"));
    startingnum->setMaxLength(int(4));
    $layout31->addWidget(startingnum);
    $layout89->addLayout($layout31);

    my $layout2 = Qt::HBoxLayout(undef, 0, 0, '$layout2');

    textLabel3 = Qt::Label(this, "textLabel3");
    textLabel3_font = Qt::Font(textLabel3->font);
    textLabel3_font->setFamily("Helvetica");
    textLabel3->setFont(textLabel3_font);
    textLabel3->setText(trUtf8("Starting IP"));
    $layout2->addWidget(textLabel3);

    startingip = Qt::LineEdit(this, "startingip");
    startingip_font = Qt::Font(startingip->font);
    startingip_font->setFamily("Helvetica");
    startingip->setFont(startingip_font);
    startingip->setText(trUtf8("0.0.0.0"));
    startingip->setMaxLength(int(15));
    $layout2->addWidget(startingip);
    $layout89->addLayout($layout2);

    my $layout5 = Qt::HBoxLayout(undef, 0, 0, '$layout5');

    textLabel6 = Qt::Label(this, "textLabel6");
    textLabel6_font = Qt::Font(textLabel6->font);
    textLabel6_font->setFamily("Helvetica");
    textLabel6->setFont(textLabel6_font);
    textLabel6->setText(trUtf8("Padding"));
    $layout5->addWidget(textLabel6);

    padding = Qt::LineEdit(this, "padding");
    padding_font = Qt::Font(padding->font);
    padding_font->setFamily("Helvetica");
    padding->setFont(padding_font);
    padding->setText(trUtf8("0"));
    padding->setMaxLength(int(2));
    $layout5->addWidget(padding);
    $layout89->addLayout($layout5);

    my $layout3 = Qt::HBoxLayout(undef, 0, 0, '$layout3');

    textLabel4 = Qt::Label(this, "textLabel4");
    textLabel4_font = Qt::Font(textLabel4->font);
    textLabel4_font->setFamily("Helvetica");
    textLabel4->setFont(textLabel4_font);
    textLabel4->setText(trUtf8("Subnet Mask"));
    $layout3->addWidget(textLabel4);

    netmask = Qt::LineEdit(this, "netmask");
    netmask_font = Qt::Font(netmask->font);
    netmask_font->setFamily("Helvetica");
    netmask->setFont(netmask_font);
    netmask->setText(trUtf8("255.255.255.0"));
    netmask->setMaxLength(int(15));
    $layout3->addWidget(netmask);
    $layout89->addLayout($layout3);

    my $layout30 = Qt::HBoxLayout(undef, 0, 0, '$layout30');

    textLabel5 = Qt::Label(this, "textLabel5");
    textLabel5_font = Qt::Font(textLabel5->font);
    textLabel5_font->setFamily("Helvetica");
    textLabel5->setFont(textLabel5_font);
    textLabel5->setText(trUtf8("Default Gateway"));
    $layout30->addWidget(textLabel5);

    gateway = Qt::LineEdit(this, "gateway");
    gateway_font = Qt::Font(gateway->font);
    gateway_font->setFamily("Helvetica");
    gateway->setFont(gateway_font);
    gateway->setText(trUtf8("0.0.0.0"));
    gateway->setMaxLength(int(15));
    $layout30->addWidget(gateway);
    $layout89->addLayout($layout30);

    my $layout6 = Qt::HBoxLayout(undef, 0, 0, '$layout6');

    textLabel7 = Qt::Label(this, "textLabel7");
    textLabel7_font = Qt::Font(textLabel7->font);
    textLabel7_font->setFamily("Helvetica");
    textLabel7->setFont(textLabel7_font);
    textLabel7->setText(trUtf8("Default Interface"));
    $layout6->addWidget(textLabel7);

    interface = Qt::ComboBox(0, this, "interface");
    interface->insertItem(trUtf8("eth0"));
    interface->insertItem(trUtf8("eth1"));
    interface_font = Qt::Font(interface->font);
    interface_font->setFamily("Helvetica");
    interface->setFont(interface_font);
    interface->setEditable(1);
    interface->setCurrentItem(int(0));
    interface->setMaxCount(int(10));
    interface->setInsertionPolicy(&Qt::ComboBox::AtTop);
    $layout6->addWidget(interface);
    $layout89->addLayout($layout6);

    my $layout88 = Qt::HBoxLayout(undef, 11, 6, '$layout88');

    imagelabel = Qt::Label(this, "imagelabel");
    imagelabel_font = Qt::Font(imagelabel->font);
    imagelabel_font->setFamily("Helvetica");
    imagelabel->setFont(imagelabel_font);
    imagelabel->setText(trUtf8("SIS Image"));
    $layout88->addWidget(imagelabel);

    image = Qt::ComboBox(0, this, "image");
    image->insertItem(trUtf8("oscarimage1"));
    image->insertItem(trUtf8("oscarimage2"));
    image_font = Qt::Font(image->font);
    image_font->setFamily("Helvetica");
    image->setFont(image_font);
    image->setEditable(0);
    image->setCurrentItem(int(0));
    image->setMaxCount(int(10));
    image->setInsertionPolicy(&Qt::ComboBox::AtTop);
    $layout88->addWidget(image);
    $layout89->addLayout($layout88);

    my $layout20 = Qt::HBoxLayout(undef, 0, 0, '$layout20');

    nodesettingsOK = Qt::PushButton(this, "nodesettingsOK");
    nodesettingsOK_font = Qt::Font(nodesettingsOK->font);
    nodesettingsOK->setFont(nodesettingsOK_font);
    nodesettingsOK->setText(trUtf8("OK"));
    $layout20->addWidget(nodesettingsOK);

    nodesettingsCancel = Qt::PushButton(this, "nodesettingsCancel");
    nodesettingsCancel_font = Qt::Font(nodesettingsCancel->font);
    nodesettingsCancel->setFont(nodesettingsCancel_font);
    nodesettingsCancel->setText(trUtf8("Cancel"));
    $layout20->addWidget(nodesettingsCancel);
    $layout89->addLayout($layout20);

    $NodeSettingsDialogLayout->addLayout($layout89, 0, 0);

    textLabel2->setBuddy(this->nameprefix);
    textLabel3->setBuddy(this->startingip);
    textLabel6->setBuddy(this->padding);
    textLabel4->setBuddy(this->netmask);
    textLabel5->setBuddy(this->gateway);
    textLabel7->setBuddy(this->interface);
    imagelabel->setBuddy(this->interface);

    init();
}


sub init
{

    Qt::Object::connect(nodesettingsCancel,
			SIGNAL 'clicked()',
			this,
			SLOT 'hide()');
    Qt::Object::connect(nodesettingsCancel,
			SIGNAL 'clicked()',
			this,
			SLOT 'restoreundo()');
    
    Qt::Object::connect(nodesettingsOK,
			SIGNAL 'clicked()',
			this,
			SLOT 'hide()');
    Qt::Object::connect(nodesettingsOK,
			SIGNAL 'clicked()',
			this,
			SLOT 'setundopoint()');
    
#    my $gateway = OSCAR::Database::database_execute_command('  
#    ***GET HOST IP OR PUBLIC GATEWAY*** ');
    
#    my $startingip = ***USE NEXT_NODE_IS LIBRARY***
#    my $netmask = OSCAR::Database::database_execute_command('
#    ***GET HOST NETMASK OR PUBLIC NETMASK*** ');

#    my $startingnum = ***NUM CLIENTS + 1 or last clientnum + 1***
    
#    my @images = ***GET LIST OF AVAILABLE IMAGES***
    
#set undo point
    setundopoint();

}

sub setundopoint
{

     our ($uprefix, $ustartnum, $ustartip, $upadding, $unetmask, $ugateway, $uinterface, @uinterfaces);
     $uprefix = nameprefix->text;
     $ustartnum = startingnum->text;
     $ustartip = startingip->text;
     $upadding = padding->text;
     $unetmask = netmask->text;
     $ugateway = gateway->text;
     $uinterface = interface->currentItem();
     @uinterfaces = ();
     for ( my $i = 0; $i < interface->count(); $i++ ) {
       push( @uinterfaces, interface->text($i) );
     }

}

sub restoreundo
{

    our ($uprefix, $ustartnum, $ustartip, $upadding, $unetmask, $ugateway, $uinterface, @uinterfaces);
    nameprefix->setText($uprefix);
    startingnum->setText($ustartnum);
    startingip->setText($ustartip);
    padding->setText($upadding);
    netmask->setText($unetmask);
    gateway->setText($ugateway);
    interface->clear();
    foreach my $int (@uinterfaces) {
	interface->insertItem($int); 
    }
    interface->setCurrentItem($uinterface);   

}

1;
