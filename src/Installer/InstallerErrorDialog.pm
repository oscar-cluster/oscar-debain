# Form implementation generated from reading ui file 'InstallerErrorDialog.ui'
#
# Created: Thu Dec 23 15:36:12 2004
#      by: The PerlQt User Interface Compiler (puic)
#
# WARNING! All changes made in this file will be lost!


use strict;
use utf8;


package InstallerErrorDialog;
use Qt;
use Qt::isa qw(Qt::Dialog);
use Qt::slots
    showDetailsButton_clicked => [],
    okButton_clicked => [],
    setErrorMainText => [],
    setErrorDetailsText => [];
use Qt::attributes qw(
    textLabel1
    textLabel1_font
    errorMainTextEdit
    errorDetailsTextEdit
    showDetailsButton
    okButton
);

my $errorDetailsHeight;;


sub NEW
{
    shift->SUPER::NEW(@_[0..3]);

    if( name() eq "unnamed" )
    {
        setName("InstallerErrorDialog");
    }
    resize(394,370);
    setCaption(trUtf8("Prerequisite Error"));

    my $InstallerErrorDialogLayout = Qt::GridLayout(this, 1, 1, 1, 1, '$InstallerErrorDialogLayout');

    my $layout5 = Qt::VBoxLayout(undef, 1, 1, '$layout5');

    textLabel1 = Qt::Label(this, "textLabel1");
    textLabel1_font = Qt::Font(textLabel1->font);
    textLabel1_font->setPointSize(16);
    textLabel1->setFont(textLabel1_font);
    textLabel1->setText(trUtf8("Error!"));
    textLabel1->setAlignment(int(&Qt::Label::AlignCenter));
    $layout5->addWidget(textLabel1);

    errorMainTextEdit = Qt::TextEdit(this, "errorMainTextEdit");
    errorMainTextEdit->setEnabled(1);
    errorMainTextEdit->setSizePolicy(Qt::SizePolicy(7, 7, 0, 1, errorMainTextEdit->sizePolicy()->hasHeightForWidth()));
    errorMainTextEdit->setPaletteBackgroundColor(Qt::Color(230, 230, 230));
    errorMainTextEdit->setText(trUtf8("Unable to start Task # 1 - \"OSCAR Package Downloader\" since some prerequisites were not satisfied.  Click the \"Show Details\" button to see which prerequisities failed and why.  Click the \"OK\" button when finished."));
    errorMainTextEdit->setReadOnly(1);
    $layout5->addWidget(errorMainTextEdit);

    errorDetailsTextEdit = Qt::TextEdit(this, "errorDetailsTextEdit");
    errorDetailsTextEdit->setEnabled(1);
    errorDetailsTextEdit->setSizePolicy(Qt::SizePolicy(7, 7, 0, 3, errorDetailsTextEdit->sizePolicy()->hasHeightForWidth()));
    errorDetailsTextEdit->setReadOnly(1);
    $layout5->addWidget(errorDetailsTextEdit);

    my $layout1 = Qt::HBoxLayout(undef, 1, 1, '$layout1');

    showDetailsButton = Qt::PushButton(this, "showDetailsButton");
    showDetailsButton->setText(trUtf8("Show &Details >>"));
    $layout1->addWidget(showDetailsButton);

    okButton = Qt::PushButton(this, "okButton");
    okButton->setText(trUtf8("&OK"));
    okButton->setDefault(1);
    $layout1->addWidget(okButton);
    $layout5->addLayout($layout1);

    $InstallerErrorDialogLayout->addLayout($layout5, 0, 0);

    Qt::Object::connect(showDetailsButton, SIGNAL "clicked()", this, SLOT "showDetailsButton_clicked()");
    Qt::Object::connect(okButton, SIGNAL "clicked()", this, SLOT "okButton_clicked()");

    init();
}


sub showDetailsButton_clicked
{

  if (errorDetailsTextEdit->isHidden())
    {
      errorDetailsTextEdit->show();
      showDetailsButton->setText("Hide &Details <<");
    }
  else
    {
      errorDetailsTextEdit->hide();
      showDetailsButton->setText("Show &Details >>");
    }

}

sub okButton_clicked
{

  done(0);

}

sub setErrorMainText
{

  my($tasknum,$taskname) = @_;
  
  my $errorText = "Unable to start Task # $tasknum - ".
                  '"' . $taskname . '" '.
                  "since some prerequisites were not satisfied.  ".
                  'Click the "Show Details" button to see which '.
                  "prerequisites failed and why.  ".
                  'Click the "OK" button when finished.';
  errorMainTextEdit->setText($errorText);

}

sub setErrorDetailsText
{

  errorDetailsTextEdit->setText(shift);

}

sub init
{

  errorDetailsTextEdit->hide();
  my $flags = getWFlags();
  setWFlags($flags | Qt::WDestructiveClose());

}

1;
