<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128 128" width="128px" height="128px">
  <!-- Background black rectangle -->
  <g>
    <rect x="0%" y="30" width="128" height="68" fill="black"/>
  </g>
  <!-- White rectangle in the middle -->
  <g>
    <rect x="4" y="34" width="120" height="60" fill="white" stroke="black" stroke-width="4px"/>
  </g>
  <!-- Progress bar -->
  <g>
    <!-- width is a multiple of 12 -->
    <rect x="6" y="36" width="{{.Width}}" height="56" fill="{{.Fill}}"/>
  </g>
  <!-- Progress text -->
  <g>
    <text x="24" y="64" fill="black" background="black" font-size="28px" dy="0.25em" style="font-family: courier new;font-size: 40px;font-weight: bold;dominant-baseline: auto">{{.Progress}}%</text>
  </g>
</svg>
