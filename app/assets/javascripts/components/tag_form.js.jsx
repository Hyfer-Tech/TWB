let TagForm = React.createClass({
  getInitialState() {
    return {
      tags: this.props.tags
    };
  },

  render() {
    var option = this.state.tags.map((tag) =>{
      return (
        <div key={tag.id}>
          <option value={tag.name}/>
        </div>
      )
    });

    return (
      <div>
        <input list="tags" placeholder="Enter Tags" ref="tag_name"/>
        <datalist id="tags">
          {option}
        </datalist>
        <input type="submit" onClick={this.handleClick}/>
      </div>
    )
  },

  handleClick() {
    var tag_name = this.refs.tag_name.value;
    $.ajax({
      url: '/taggings',
      type: 'POST',
      data: { tag: tag_name },
      success: (response) => {
        console.log("It Worked");
      }
    });
  }
});