class GroupValidator < ActiveModel::Validator
    def validate(record)
        if record.teacher.taught_classes.count {|g| g.name == record.name} > 0
            record.errors[:group] << "already exists"
        end
    end
end