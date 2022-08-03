package main

import (
	"bytes"
	"fmt"
	"os"
	"text/template"
)

type ProgressBar struct {
	Fill     string
	Width    int // multiple of 12
	Progress int
}

func main() {
	bars := []ProgressBar{}
	for i := 0; i <= 10; i++ {
		bars = append(bars, NewProgressBar(120, i*10))
	}
	tplSource, err := os.ReadFile("base.svg.tpl")
	if err != nil {
		panic(err)
	}
	tpl, err := template.New("svg").Parse(string(tplSource))
	if err != nil {
		panic(err)
	}
	for idx, bar := range bars {
		buf := bytes.Buffer{}
		if err := tpl.Execute(&buf, bar); err != nil {
			panic(err)
		}
		os.WriteFile(fmt.Sprintf("gen/progress%d.svg", idx*10), buf.Bytes(), os.ModeExclusive|0o660)
	}
}

func NewProgressBar(fullWidth int, progress int) ProgressBar {
	bar := ProgressBar{
		Width:    progress * (fullWidth - 4) / 100, // substract 4 which is the stroke width
		Progress: progress,
	}
	switch {
	case progress < 50:
		bar.Fill = "red"
	case progress < 80:
		bar.Fill = "yellow"
	default:
		bar.Fill = "#15e315"
	}
	return bar
}
