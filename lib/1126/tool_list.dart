class ToolList {
  String image;
  String tool;
  String time;
  bool isSelected;

  ToolList({this.image, this.tool, this.time, this.isSelected});
}

List<ToolList> toolList = [
  ToolList(image: "assets/tool/youtube.png", tool: "Youtube Premium", time: "Expired 2 days ago", isSelected: true),
  ToolList(image: "assets/tool/netflix.png", tool: "Netflix", time: "Expires on 10/22/19 - 3 days left", isSelected: false),
  ToolList(image: "assets/tool/spotify.png", tool: "Spotify", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
  ToolList(image: "assets/tool/adobe.png", tool: "Adobe Cloud Creative", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
  ToolList(image: "assets/tool/photoshop.png", tool: "Photoshop CC 2020", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
  ToolList(image: "assets/tool/dropbox.png", tool: "Dropbox", time: "Expires on 10/27/19 - 8 days left", isSelected: false),

  //
  ToolList(image: "assets/tool/youtube.png", tool: "Youtube Premium", time: "Expired 2 days ago", isSelected: false),
  ToolList(image: "assets/tool/netflix.png", tool: "Netflix", time: "Expires on 10/22/19 - 3 days left", isSelected: false),
  ToolList(image: "assets/tool/spotify.png", tool: "Spotify", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
  ToolList(image: "assets/tool/adobe.png", tool: "Adobe Cloud Creative", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
  ToolList(image: "assets/tool/photoshop.png", tool: "Photoshop CC 2020", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
  ToolList(image: "assets/tool/dropbox.png", tool: "Dropbox", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
];
