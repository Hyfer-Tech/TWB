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
        <input list="tags"/>
        <datalist id="tags">
          {option}
        </datalist>
        <input type="submit"/>
      </div>
    )
  }
});