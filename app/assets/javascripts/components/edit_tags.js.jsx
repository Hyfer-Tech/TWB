let EditTags = React.createClass({
  getInitialState() {
    return { 
      editable: false,
      tag_list: this.props.tag_list 
    }
  },

  handleEdit() {
    if(this.state.editable) { 
      let updated_tag_list = {
        tag_list: this.state.tag_list
      }

      this.handleUpdate(updated_tag_list);
    }
    this.defineArray();
    this.setState({editable: !this.state.editable});
  },

  showTags(){
    if (this.state.editable) {
      return (
        <div>
          <select multiple className="chosen-select" onChange={this.handleTags}>
            {this.tags_list_display()}
          </select>
          <button type="button" onClick={this.handleEdit}>Update</button>
        </div>
      )  
    } else {
      return (
        <div>
          <i className="fa fa-tags" aria-hidden="true"></i>
          {
            this.state.tag_list.map((tag) => {
              return (
                <span className="label label-default" key={tag}>{tag}</span>
              )
            })
          }
          <a href="#" onClick={this.handleEdit} className="pull-right">Edit</a>
        </div>
      ) 
    }
  },

  tags_list_display() {
    return (
      this.props.all_tags.map((tag) => {
        return (
          <option value={tag} key={tag}>{tag}</option>
        )
      })
    )
  },

  handleTags(e) {
    new_tags.push(e.target.value);

    this.setState({ tag_list: new_tags });
  },

  defineArray() {
    return (
      new_tags = []
    )
  },

  handleUpdate(updated_tag_list) {
    let data = {};
    data[this.props.user_type_name] = updated_tag_list;

    $.ajax({

      url: `/${this.props.user_type_name}s`,
      type: 'PATCH',
      dataType: 'JSON',
      data: data
    });
  },

  render() {
    return (
      <div>
        {this.showTags()}
      </div>
    )
  }
});