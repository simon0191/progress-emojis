<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128 128" width="128px" height="128px">
  <style><![CDATA[
    text{
      dominant-baseline: auto;
      font-weight: bold;
      font-size: 40px;
      font-family: courier new;
      text-align: center;
    }
  ]]></style>
  <!-- Background black rectangle
  <g>
    <rect x="0%" y="32" width="128" height="64" fill="black"/>
  </g> -->
  <!-- White rectangle in the middle -->
  <g>
    <rect x="4" y="34" width="120" height="60" fill="white" style="stroke:black; stroke-width:4px" rx="15" ry="15"/>
  </g>
  <!-- Progress bar -->
  <g>
    <!-- width is a multiple of 12 -->
    <rect x="6" y="36" width="{{.Width}}" height="56" fill="{{.Fill}}" rx="10" ry="10"/>
  </g>
  <!-- Progress text -->
  <g>
    <text x="24" y="64" fill="black" background="black" font-size="28px" dy="0.25em">{{.Progress}}%</text>
  </g>
</svg>