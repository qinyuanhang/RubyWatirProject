class MyReportCreater
  def get_time_name
    $time=Time.now
    $time_name="#{$time.hour.to_s}-#{$time.min.to_s}-#{$time.sec.to_s}-#{$time.day.to_s}-#{$time.mon.to_s}-#{$time.year.to_s}"
    $result_date = "#{$time.day.to_s}-#{$time.month.to_s}-#{$time.year.to_s}"
  end


  def create_report
    get_time_name
    @result_file_name="Report"+"-"+$time_name
    @full_file_name="Results/#{@result_file_name}.html"
    $report=File.open(@full_file_name,'w')
  end


  def insert_head_title(title)
    $report.puts "<html><head>
                <title> #{title} </title>
            </head>"
  end



  def start_table
    $report=File.open(@full_file_name,'a')
    $report.puts "<table border=1>
      <tr>
            <th>Test Case Name</th>
            <th>Browser Name</th>
            <th>Result</th>
            <th>failure reason</th>
      </tr>"
    $report.close
  end




  def insert_reportname_date(name,date)
    $report.puts "<body bgcolor='#5CB3FF'>
                    <p size=12>
                          <center> <b><u>#{name} </u></b></center>
                    </p>
                    <p align='right' size=12>
                           <b>Date: #{date} </b>
                    </p>"
    $report.close
  end




  def report_row(*details)
    $report=File.open(@full_file_name,'a')
    test_name=details[0]
    test_result=details[1]
    test_browser_type=details[2]
    fail_reason=details[3]

    if tes_result.downcase == "pass"
      $report.puts "<tr>
                      <td>#{test_name}</td>
                      <td> #{test_browser_type} </td>
                      <td bgcolor='green'>#{test_result}</td>
                      <td>#{fail_reason}</td>
                    </tr>"
    else
      $report.puts "<tr>
                      <td>#{test_name}</td>
                      <td> #{test_browser_type} </td>
                      <td bgcolor='red'>#{test_result}</td>
                      <td>#{fail_reason}</td>
                    </tr>"
    end
    $report.close
  end





  def close_table
    $report=File.open(@full_file_name,'a')
    $report.puts "</table></br>"
    $report.close
  end

# add bounes 4 at the end of report
  def summary_report(all,month_31,month_less_31)
    $report=File.open(@full_file_name,'a')
    $report.puts "<p> <b>   the number of articles that have the '"'Business'"' tag is #{all} </b></p>
<p> <b>Passed : the number of articles that have the '"'Business'"' tag with months that have less than 31 days is #{month_31} </b></p>
<p> <b>Failed : the number of articles that have the '"'Business'"' tag that occur on months with 31 days is #{month_less_31} </b></p>
</body>
</html>"
    $report.close
  end


end


create_report
insert_head_title("Raveendran -- Sample HTML Report")
insert_reportname_date("My Test Report",$result_date )
start_table
report_row("Check Google Home Page","IE","PASS","Title Present")
report_row("Check Google Home Page","FF","FAIL","Title Not Present")
close_table
summary_report(2,1,1)
