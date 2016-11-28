let EditTags = React.createClass({
  getInitialState() {
    return { 
      editable: false,
      tag_list: this.props.tag_list 
    }
  },

  componentDidUpdate() {
    $('.chosen-select').chosen().change(this.handleTags);
  },

  handleEdit() {
    if(this.state.editable) { 
      let updated_tag_list = {
        tag_list: this.state.tag_list
      }

      this.handleUpdate(updated_tag_list);
      $(".chosen-container").remove();
    }
  
    this.setState(
      {editable: !this.state.editable},
    );

    
  },

  handleTags(e) {
    this.setState({ tag_list: $(".chosen-select").val() });
  },

  handleCancel() {
    this.setState({editable:false});
    $(".chosen-container").remove();
  },

  showTags(){
    if (this.state.editable) {
      return (
        <div>
          <select multiple="true" className="chosen-select" value={this.state.tag_list}>
            {this.tags_list_display()}
          </select>
          <button type="button" onClick={this.handleEdit}>Update</button>
          <button type="button" onClick={this.handleCancel}>Cancel</button>
        </div>
      )  
    } else {
      return (
        <div onClick={this.handleEdit}>
          <i className="fa fa-tags" aria-hidden="true"></i>
          {
            this.state.tag_list.map((tag) => {
              return (
                <span className="label label-default" id="tags-list-profile" key={tag}>{tag}</span>
              )
            })
          }
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