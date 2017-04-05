


def get_time_name
  $time=Time.now
  $time_name="#{$time.hour.to_s}-#{$time.min.to_s}-#{$time.sec.to_s}-#{$time.day.to_s}-#{$time.mon.to_s}-#{$time.year.to_s}"
  $result_date = "#{$time.day.to_s}-#{$time.month.to_s}-#{$time.year.to_s}"
end


def create_report
  time_name=get_time_name
  result_file_name="Report"+"-"+time_name
  full_file_name="Results/#{result_file_name}.html"
  report=File.open(full_file_name,'w')
  report.close
  return  full_file_name
end


def insert_head_title(full_file_name,title)
  report=File.open(full_file_name,'w')
  report.puts "<html><head>
<title> #{title} </title>
</head>"
  report.close
end


def start_table(full_file_name)
  report=File.open(full_file_name,'a')
  report.puts "<table border=1>
<tr>
<th>Test Case Name</th>
<th>Browser Name</th>
<th>Result</th>

</tr>"
  report.close
end



def insert_reportname_date(full_file_name,name,date)
  report=File.open(full_file_name,'a')
  report.puts "<body'>
<p align='left' size=2>
</p>
<p size=12>
<center> <b><u>#{name} </u></b></center>
</p>
<p align='right' size=12>
<b>Date: #{date} </b>
</p>"
  report.close
end





def report_row(full_file_name,*details)
  report=File.open(full_file_name,'a')
  name=details[0]
  browser=details[1]
  result=details[2]


    report.puts "<tr>
<td>#{name}</td>
<td> #{browser} </td>
<td>#{result}</td>
</tr>"

  report.close
end


def close_table(full_file_name)
  report=File.open(full_file_name,'a')
  report.puts "</table></br>"
  report.close
end

def summary_report(full_file_name,all,month_31,month_less_31)
  report=File.open(full_file_name,'a')
  report.puts "<p> <b>Total '"'Business'"' tag : #{all} </b></p>
                <p> <b>the number of articles with months that have 31 days : #{month_31} </b></p>
                <p> <b>the number of articles with months that have less than 31 days : #{month_less_31} </b></p>
                </body>
                </html>"
  report.close
end






/
create_report
insert_head_title("Raveendran -- Sample HTML Report")
insert_reportname_date("My Test Report",$result_date )
start_table
report_row("Check Google Home Page","Check The Title in Google Home Page","IE","PASS","Title Present")
report_row("Check Google Home Page","Check The Title in Google Home Page","FF","FAIL","Title Not Present")
close_table
summary_report(2,1,1)
/