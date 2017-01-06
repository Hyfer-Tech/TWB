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

  message(){
    if (this.state.tag_list.length == 0) {
      return (
        <p>Click to add tags</p>
      )
    }
  },

  showTags(){
    if (this.state.editable) {
      return (
        <div className="col-xs-12">
          <select multiple="true" className="chosen-select" value={this.state.tag_list}>
            {this.tags_list_display()}
          </select>          

          <div className="btn-group" style={{"marginTop": "10px"}}>
            <button type="button" className="btn btn-sm btn-success" onClick={this.handleEdit}>Update</button>
            <button type="button" className="btn btn-sm btn-danger" onClick={this.handleCancel}>Cancel</button>
          </div>
        </div>
      )
    } else {
      return (
        <div className="col-xs-12" onClick={this.handleEdit}>
          {
            this.state.tag_list.map((tag) => {
              return (
                <span className="label label-user" id="tags-list-profile" key={tag}>{tag}</span>
              )
            })            
          }

          {this.message()}

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
        <div className="col-xs-12">
          <h3>Tags</h3>
        </div>
        <div className="col-xs-12">
          {this.showTags()}
        </div>
      </div>
    )
  }
});
