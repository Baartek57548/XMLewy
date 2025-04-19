<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Raport Transakcji</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            margin: 20px;
          }
          h2 {
            color: #333;
            margin-top: 30px;
          }
          table {
            border-collapse: collapse;
            width: 50%;
            margin-bottom: 30px;
          }
          th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
            font-weight: bold;
          }
          tr.sum-row {
            font-weight: bold;
            background-color: #f9f9f9;
          }
        </style>
      </head>
      <body>
        <!-- Transactions in PLN -->
        <h2>Transakcje w PLN:</h2>
        <table>
          <tr>
            <th>Lp.</th>
            <th>Nazwa transakcji</th>
            <th>Kwota</th>
          </tr>
          
          <!-- Wpłata PLN -->
          <tr>
            <td>1</td>
            <td>wpłata</td>
            <td>
              <xsl:value-of select="format-number(sum(//transakcja[@waluta='PLN' and @nazwa='wpłata']/@kwota), '#0.00')"/>
            </td>
          </tr>
          
          <!-- Odsetki PLN -->
          <tr>
            <td>2</td>
            <td>odsetki</td>
            <td>
              <xsl:value-of select="format-number(sum(//transakcja[@waluta='PLN' and @nazwa='odsetki']/@kwota), '#0.00')"/>
            </td>
          </tr>
          
          <!-- Przelew PLN -->
          <tr>
            <td>3</td>
            <td>przelew</td>
            <td>
              <xsl:value-of select="format-number(sum(//transakcja[@waluta='PLN' and @nazwa='przelew']/@kwota), '#0.00')"/>
            </td>
          </tr>
          
          <!-- Korekta PLN -->
          <tr>
            <td>4</td>
            <td>korekta</td>
            <td>
              <xsl:value-of select="format-number(sum(//transakcja[@waluta='PLN' and @nazwa='korekta']/@kwota), '#0.00')"/>
            </td>
          </tr>
          
          <!-- Sum PLN -->
          <tr>
            <td colspan="2">SUMA</td>
            <td>
              <xsl:value-of select="format-number(sum(//transakcja[@waluta='PLN']/@kwota), '#0.00')"/>
            </td>
          </tr>
        </table>
        
        <!-- Transactions in EUR -->
        <h2>Transakcje w EUR:</h2>
        <table>
          <tr>
            <th>Lp.</th>
            <th>Nazwa transakcji</th>
            <th>Ilość</th>
          </tr>
          
          <!-- Wpłata EUR -->
          <tr>
            <td>1</td>
            <td>wpłata</td>
            <td>
              <xsl:value-of select="format-number(sum(//transakcja[@waluta='EUR' and @nazwa='wpłata']/@kwota), '#0.00')"/>
            </td>
          </tr>
          
          <!-- Odsetki EUR -->
          <tr>
            <td>2</td>
            <td>odsetki</td>
            <td>
              <xsl:value-of select="format-number(sum(//transakcja[@waluta='EUR' and @nazwa='odsetki']/@kwota), '#0.00')"/>
            </td>
          </tr>
          
          <!-- Przelew EUR -->
          <tr>
            <td>3</td>
            <td>przelew</td>
            <td>
              <xsl:value-of select="format-number(sum(//transakcja[@waluta='EUR' and @nazwa='przelew']/@kwota), '#0.00')"/>
            </td>
          </tr>
          
          <!-- Korekta EUR -->
          <tr>
            <td>4</td>
            <td>korekta</td>
            <td>
              <xsl:value-of select="format-number(sum(//transakcja[@waluta='EUR' and @nazwa='korekta']/@kwota), '#0.00')"/>
            </td>
          </tr>
          
          <!-- Sum EUR -->
          <tr>
            <td colspan="2">SUMA</td>
            <td>
              <xsl:value-of select="format-number(sum(//transakcja[@waluta='EUR']/@kwota), '#0.00')"/>
            </td>
          </tr>
        </table>
        
        <!-- Transactions by person -->
        <h2>Ilość transakcji wykonanych przez poszczególne osoby:</h2>
        <table>
          <tr>
            <th>Lp.</th>
            <th>Wykonawca</th>
            <th>Ilość transakcji</th>
          </tr>
          
          <!-- Jan J. -->
          <tr>
            <td>1</td>
            <td>Jan J.</td>
            <td>
              <xsl:value-of select="count(//transakcja[@wykonawca='Jan J.'])"/>
            </td>
          </tr>
          
          <!-- Ewa B. -->
          <tr>
            <td>2</td>
            <td>Ewa B.</td>
            <td>
              <xsl:value-of select="count(//transakcja[@wykonawca='Ewa B.'])"/>
            </td>
          </tr>
          
          <!-- Adam A. -->
          <tr>
            <td>3</td>
            <td>Adam A.</td>
            <td>
              <xsl:value-of select="count(//transakcja[@wykonawca='Adam A.'])"/>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>