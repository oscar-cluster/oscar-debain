# Form implementation generated from reading ui file 'OpderAddRepository.ui'
#
# Created: Thu Dec 23 15:36:07 2004
#      by: The PerlQt User Interface Compiler (puic)
#
# WARNING! All changes made in this file will be lost!


use strict;
use utf8;


package OpderAddRepository;
use Qt;
use Qt::isa qw(Qt::Dialog);
use Qt::slots
    doneButton_clicked => [],
    hideEvent => [],
    init => [];
use Qt::attributes qw(
    textLabel1
    urlTextBox
    exclusiveCheckBox
    doneButton
);

use Qt::attributes qw( useRepositoriesExclusively urlText );;
use Qt::signals refreshTableNeeded=>[];;
use lib "$ENV{OSCAR_HOME}/lib"; use OSCAR::Database;;

sub uic_load_pixmap_OpderAddRepository
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
        setName("OpderAddRepository");
    }
    resize(373,181);
    setCaption(trUtf8("Use Additional OPD Repositories"));

    my $OpderAddRepositoryLayout = Qt::GridLayout(this, 1, 1, 1, 0, '$OpderAddRepositoryLayout');

    my $layout8 = Qt::VBoxLayout(undef, 11, 6, '$layout8');

    textLabel1 = Qt::Label(this, "textLabel1");
    textLabel1->setText(trUtf8("Enter URLs for additional OPD repositories, one per line."));
    $layout8->addWidget(textLabel1);

    urlTextBox = Qt::TextEdit(this, "urlTextBox");
    urlTextBox->setTextFormat(&Qt::TextEdit::PlainText);
    Qt::ToolTip::add(urlTextBox, trUtf8("Prepend URLs with http://, ftp://, or file:///"));
    $layout8->addWidget(urlTextBox);

    exclusiveCheckBox = Qt::CheckBox(this, "exclusiveCheckBox");
    exclusiveCheckBox->setText(trUtf8("Use these repositories EXCLUSIVELY"));
    Qt::ToolTip::add(exclusiveCheckBox, trUtf8("Ignore the standard OPD repositories"));
    $layout8->addWidget(exclusiveCheckBox);

    doneButton = Qt::PushButton(this, "doneButton");
    doneButton->setText(trUtf8("&Done"));
    Qt::ToolTip::add(doneButton, trUtf8("Close this window and apply changes"));
    $layout8->addWidget(doneButton);

    $OpderAddRepositoryLayout->addLayout($layout8, 0, 0);

    Qt::Object::connect(doneButton, SIGNAL "clicked()", this, SLOT "doneButton_clicked()");

    init();
}


sub doneButton_clicked
{

#########################################################################
#  Subroutine: doneButton_clicked()                                     #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  This subroutine gets called when the user clicks the "Done" button.  #
#  It simply hides the window, which then generates a 'hide' event and  #
#  does the necessary post-processing.                                  #
#########################################################################

  hide();

}

sub hideEvent
{

#########################################################################
#  Subroutine: hideEvent()                                              #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  This subroutine gets called when the user hides the window.  It      #
#  gets the new state of the window (i.e. the checkbox and textbox)     #
#  and assigns the global variables as necessary.  It also checks to    #
#  to see if any changes were made, and if so, requests that the table  #
#  be refreshed.                                                        #
#########################################################################

  # Save old state of checkbox to see if there was a change
  my $oldUseRepositoriesExclusively = useRepositoriesExclusively;
  useRepositoriesExclusively = exclusiveCheckBox->isChecked();
  
  # Save old state of textbox to see if there was a change
  my $oldUrlText = urlTextBox->text();
  # Get the URLs from the text box and fix them up a bit
  my $text = urlTextBox->text();
  urlText = "";
  $text =~ s/\n/ /g;  # Change newlines to spaces
  $text =~ s/^ *//;   # Strip leading spaces
  $text =~ s/ *$//;   # Strip trailing spaces
  $text =~ s/ +/ /g;  # Compact multiple spaces into a single space
  # Check the urls and see if we need to append http://
  foreach my $rep (split / /, $text)
    { # Append http:// for those strings that need it
      $rep = 'http://' . $rep if ($rep !~ /^(http|ftp|file):\/\//);
      # Add the completed url to the urlText global variable
      urlText .= "$rep\n";
    }

  if (OSCAR::Database::database_connect())
    { # Write the values of the widgets to the oda database
      OSCAR::Database::database_program_variable_put(
        "Opder","urlText",urlText);
      OSCAR::Database::database_program_variable_put(
        "Opder","useRepositoriesExclusively",useRepositoriesExclusively);
    }
                                                                                
  # Finally, check for any changes which would require a "Refresh Table"
  my $update = 0;
  $update = 1 if (($oldUrlText ne urlText) ||
    ($oldUseRepositoriesExclusively != useRepositoriesExclusively));
  
  emit refreshTableNeeded() if ($update);

}

sub init
{

#########################################################################
#  Subroutine: init()                                                   #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  This subroutine gets called when the window is first created. We     #
#  check to see if the oda database is running, and if so, get the      #
#  last values for the exclusiveCheckBox and urlTextBox.  Thus, these   #
#  values are persistent across executions of the program.              #
#########################################################################
                                                                                
  if (OSCAR::Database::database_connect())
    {
      my @urlText = OSCAR::Database::database_program_variable_get(
        "Opder","urlText");
      urlText = $urlText[0];
      urlTextBox->setText(urlText);
                                                                                
      my @useRepositoriesExclusively = 
        OSCAR::Database::database_program_variable_get(
          "Opder","useRepositoriesExclusively");
      useRepositoriesExclusively = $useRepositoriesExclusively[0];
      exclusiveCheckBox->setChecked(useRepositoriesExclusively);
    }

}

1;
